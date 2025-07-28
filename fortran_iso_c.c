#include <stdio.h>
#include <math.h>

// ISO C bound Fortran function declarations - no more underscores or pointer hassles!
extern double f_fortran(double x);
extern double g_fortran(double x);
extern double h_fortran(double x);

// Enzyme autodiff function declaration
extern double __enzyme_autodiff(void*, double);

int main() {
    double x = 2.0;
    
    printf("=== Direct Fortran-Enzyme Integration via ISO C Binding ===\n");
    
    // Test Fortran function f(x) = x^2 + 2x + 1, derivative should be 2x + 2 = 6
    printf("Testing Fortran f(x) = x^2 + 2x + 1 at x = %.1f\n", x);
    printf("f_fortran(%.1f) = %.6f\n", x, f_fortran(x));
    printf("f_fortran'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(f_fortran, x), 2*x + 2);
    
    // Test Fortran function g(x) = sin(x) * cos(x)
    printf("\nTesting Fortran g(x) = sin(x) * cos(x) at x = %.1f\n", x);
    printf("g_fortran(%.1f) = %.6f\n", x, g_fortran(x));
    printf("g_fortran'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(g_fortran, x), cos(x)*cos(x) - sin(x)*sin(x));
    
    // Test Fortran function h(x) = exp(x) + log(x+1)
    printf("\nTesting Fortran h(x) = exp(x) + log(x+1) at x = %.1f\n", x);
    printf("h_fortran(%.1f) = %.6f\n", x, h_fortran(x));
    printf("h_fortran'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(h_fortran, x), exp(x) + 1.0/(x+1));
    
    return 0;
}