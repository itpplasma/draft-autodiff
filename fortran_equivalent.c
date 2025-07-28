#include <stdio.h>
#include <math.h>

// C functions equivalent to the Fortran functions
// These implement the same math as the Fortran versions
double f_equiv(double x) {
    // Equivalent to Fortran: y = x * x + 2.0 * x + 1.0
    return x * x + 2.0 * x + 1.0;
}

double g_equiv(double x) {
    // Equivalent to Fortran: y = sin(x) * cos(x)
    return sin(x) * cos(x);
}

double h_equiv(double x) {
    // Equivalent to Fortran: y = exp(x) + log(x + 1.0)
    return exp(x) + log(x + 1.0);
}

// Original Fortran functions for comparison
extern float f_(float *x);
extern float g_(float *x);
extern float h_(float *x);

float call_fortran_f(float x) { return f_(&x); }
float call_fortran_g(float x) { return g_(&x); }
float call_fortran_h(float x) { return h_(&x); }

// Enzyme autodiff function declaration
extern double __enzyme_autodiff(void*, double);

int main() {
    double x = 2.0;
    
    printf("=== Comparison: Fortran vs C equivalent functions ===\n");
    printf("f_fortran(%.1f) = %.6f\n", x, call_fortran_f((float)x));
    printf("f_equiv(%.1f)   = %.6f\n", x, f_equiv(x));
    
    printf("g_fortran(%.1f) = %.6f\n", x, call_fortran_g((float)x));
    printf("g_equiv(%.1f)   = %.6f\n", x, g_equiv(x));
    
    printf("h_fortran(%.1f) = %.6f\n", x, call_fortran_h((float)x));
    printf("h_equiv(%.1f)   = %.6f\n", x, h_equiv(x));
    
    printf("\n=== Enzyme autodiff on C equivalent functions ===\n");
    
    // Test function f(x) = x^2 + 2x + 1, derivative should be 2x + 2 = 6
    printf("Testing f_equiv(x) = x^2 + 2x + 1 at x = %.1f\n", x);
    printf("f_equiv(%.1f) = %.6f\n", x, f_equiv(x));
    printf("f_equiv'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(f_equiv, x), 2*x + 2);
    
    // Test function g(x) = sin(x) * cos(x), derivative should be cos^2(x) - sin^2(x)
    printf("\nTesting g_equiv(x) = sin(x) * cos(x) at x = %.1f\n", x);
    printf("g_equiv(%.1f) = %.6f\n", x, g_equiv(x));
    printf("g_equiv'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(g_equiv, x), cos(x)*cos(x) - sin(x)*sin(x));
    
    // Test function h(x) = exp(x) + log(x+1), derivative should be exp(x) + 1/(x+1)
    printf("\nTesting h_equiv(x) = exp(x) + log(x+1) at x = %.1f\n", x);
    printf("h_equiv(%.1f) = %.6f\n", x, h_equiv(x));
    printf("h_equiv'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(h_equiv, x), exp(x) + 1.0/(x+1));
    
    return 0;
}