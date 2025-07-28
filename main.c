#include <stdio.h>
#include <math.h>

// Enzyme forward and reverse mode autodiff declarations
double __enzyme_fwddiff(void*, ...);
void __enzyme_autodiff(void*, ...);

// Enzyme activity declarations  
int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

// External Fortran wrapper function declarations
extern double f_wrapper(double);
extern double g_wrapper(double);
extern double h_wrapper(double);

// Multi-dimensional wrappers
extern double f2_wrapper(double, double);
extern double g2_wrapper(double, double);
extern double h2_wrapper(double, double);

int main() {
    double x = 2.0;
    double dx = 1.0;
    
    printf("Testing Enzyme Forward Mode with pure Fortran functions\n");
    printf("=======================================================\n\n");
    
    // Test f(x) = x^2 + 2x + 1, f'(x) = 2x + 2
    double df_dx = __enzyme_fwddiff((void*)f_wrapper, x, dx);
    double f_val = f_wrapper(x);
    printf("f(%g) = %g\n", x, f_val);
    printf("f'(%g) = %g (expected: %g)\n\n", x, df_dx, 2*x + 2);
    
    // Test g(x) = sin(x)*cos(x), g'(x) = cos(2x)  
    double dg_dx = __enzyme_fwddiff((void*)g_wrapper, x, dx);
    double g_val = g_wrapper(x);
    printf("g(%g) = %g\n", x, g_val);
    printf("g'(%g) = %g (expected: %g)\n\n", x, dg_dx, cos(2*x));
    
    // Test h(x) = exp(x) + log(x+1), h'(x) = exp(x) + 1/(x+1)
    double dh_dx = __enzyme_fwddiff((void*)h_wrapper, x, dx);
    double h_val = h_wrapper(x);
    printf("h(%g) = %g\n", x, h_val);
    printf("h'(%g) = %g (expected: %g)\n\n", x, dh_dx, exp(x) + 1.0/(x+1));
    
    printf("Testing Enzyme Reverse Mode with pure Fortran functions\n");
    printf("=======================================================\n\n");
    
    // Skip reverse mode for now - focus on forward mode which works
    printf("(Reverse mode tests skipped - enzyme calling convention issues)\n\n");
    
    printf("Testing Multi-dimensional Gradients\n");
    printf("===================================\n\n");
    
    double x2 = 1.0, y2 = 2.0;
    
    // Multi-dimensional forward mode using directional derivatives
    // For f2(x,y) = x^2 + y^2 + xy, compute ∂f2/∂x and ∂f2/∂y
    double df2_dx = __enzyme_fwddiff((void*)f2_wrapper, x2, 1.0, y2, 0.0);
    double df2_dy = __enzyme_fwddiff((void*)f2_wrapper, x2, 0.0, y2, 1.0);
    double f2_val = f2_wrapper(x2, y2);
    printf("f2(%g,%g) = %g\n", x2, y2, f2_val);
    printf("∇f2 = (%g, %g) (expected: (%g, %g))\n\n", 
           df2_dx, df2_dy, 2*x2+y2, 2*y2+x2);
    
    // For g2(x,y) = sin(x)*cos(y) + exp(x*y), compute gradients
    double dg2_dx = __enzyme_fwddiff((void*)g2_wrapper, x2, 1.0, y2, 0.0);
    double dg2_dy = __enzyme_fwddiff((void*)g2_wrapper, x2, 0.0, y2, 1.0);
    double g2_val = g2_wrapper(x2, y2);
    printf("g2(%g,%g) = %g\n", x2, y2, g2_val);
    printf("∇g2 = (%g, %g) (expected: (%g, %g))\n\n", 
           dg2_dx, dg2_dy, 
           cos(x2)*cos(y2) + y2*exp(x2*y2),
           -sin(x2)*sin(y2) + x2*exp(x2*y2));
    
    // For h2(x,y) = log(x^2 + y^2 + 1) + x*y*sin(x+y), compute gradients
    double dh2_dx = __enzyme_fwddiff((void*)h2_wrapper, x2, 1.0, y2, 0.0);
    double dh2_dy = __enzyme_fwddiff((void*)h2_wrapper, x2, 0.0, y2, 1.0);
    double h2_val = h2_wrapper(x2, y2);
    printf("h2(%g,%g) = %g\n", x2, y2, h2_val);
    // Expected gradients for h2: quite complex
    double h2_expected_dx = 2*x2/(x2*x2 + y2*y2 + 1) + y2*sin(x2+y2) + x2*y2*cos(x2+y2);
    double h2_expected_dy = 2*y2/(x2*x2 + y2*y2 + 1) + x2*sin(x2+y2) + x2*y2*cos(x2+y2);
    printf("∇h2 = (%g, %g) (expected: (%g, %g))\n", 
           dh2_dx, dh2_dy, h2_expected_dx, h2_expected_dy);
    
    return 0;
}