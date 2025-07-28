#include <stdio.h>
#include <math.h>

// Fortran function declarations (note the underscore and pointer argument)
extern float f_(float *x);
extern float g_(float *x);
extern float h_(float *x);

// C wrapper functions that convert calling convention for enzyme
double f_c(double x) {
    float fx = (float)x;
    return (double)f_(&fx);
}

double g_c(double x) {
    float fx = (float)x;
    return (double)g_(&fx);
}

double h_c(double x) {
    float fx = (float)x;
    return (double)h_(&fx);
}

// Enzyme autodiff function declaration
extern double __enzyme_autodiff(void*, double);

int main() {
    double x = 2.0;
    
    // Test Fortran function f(x) = x^2 + 2x + 1, derivative should be 2x + 2 = 6
    printf("Testing Fortran f(x) = x^2 + 2x + 1 at x = %.1f\n", x);
    printf("f(%.1f) = %.6f\n", x, f_c(x));
    printf("f'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(f_c, x), 2*x + 2);
    
    // Test Fortran function g(x) = sin(x) * cos(x)
    printf("\nTesting Fortran g(x) = sin(x) * cos(x) at x = %.1f\n", x);
    printf("g(%.1f) = %.6f\n", x, g_c(x));
    printf("g'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(g_c, x), cos(x)*cos(x) - sin(x)*sin(x));
    
    // Test Fortran function h(x) = exp(x) + log(x+1)
    printf("\nTesting Fortran h(x) = exp(x) + log(x+1) at x = %.1f\n", x);
    printf("h(%.1f) = %.6f\n", x, h_c(x));
    printf("h'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(h_c, x), exp(x) + 1.0/(x+1));
    
    return 0;
}