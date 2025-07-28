#include <stdio.h>
#include <math.h>

// Fortran function declarations (note the underscore)
extern float f_(float *x);
extern float g_(float *x);
extern float h_(float *x);

// Enzyme autodiff function declaration
extern double __enzyme_autodiff(void*, double);

// Wrapper functions for enzyme (convert to double and call original)
double f_wrapper(double x) {
    float fx = (float)x;
    return (double)f_(&fx);
}

double g_wrapper(double x) {
    float fx = (float)x;
    return (double)g_(&fx);
}

double h_wrapper(double x) {
    float fx = (float)x;
    return (double)h_(&fx);
}

int main() {
    double x = 2.0;
    
    // Test function f(x) = x^2 + 2x + 1, derivative should be 2x + 2 = 6
    printf("Testing f(x) = x^2 + 2x + 1 at x = %.1f\n", x);
    printf("f(%.1f) = %.6f\n", x, f_wrapper(x));
    printf("f'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(f_wrapper, x), 2*x + 2);
    
    // Test function g(x) = sin(x) * cos(x), derivative should be cos^2(x) - sin^2(x)
    printf("\nTesting g(x) = sin(x) * cos(x) at x = %.1f\n", x);
    printf("g(%.1f) = %.6f\n", x, g_wrapper(x));
    printf("g'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(g_wrapper, x), cos(x)*cos(x) - sin(x)*sin(x));
    
    // Test function h(x) = exp(x) + log(x+1), derivative should be exp(x) + 1/(x+1)
    printf("\nTesting h(x) = exp(x) + log(x+1) at x = %.1f\n", x);
    printf("h(%.1f) = %.6f\n", x, h_wrapper(x));
    printf("h'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(h_wrapper, x), exp(x) + 1.0/(x+1));
    
    return 0;
}