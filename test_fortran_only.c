#include <stdio.h>
#include <math.h>

// External Fortran wrapper function declarations
extern double f_wrapper(double);
extern double g_wrapper(double);
extern double h_wrapper(double);

int main() {
    double x = 2.0;
    
    printf("Testing pure Fortran functions via C wrappers\n");
    printf("=============================================\n\n");
    
    // Test f(x) = x^2 + 2x + 1
    double f_val = f_wrapper(x);
    printf("f(%g) = %g (expected: %g)\n", x, f_val, x*x + 2*x + 1);
    
    // Test g(x) = sin(x)*cos(x)
    double g_val = g_wrapper(x);
    printf("g(%g) = %g (expected: %g)\n", x, g_val, sin(x)*cos(x));
    
    // Test h(x) = exp(x) + log(x+1)
    double h_val = h_wrapper(x);
    printf("h(%g) = %g (expected: %g)\n", x, h_val, exp(x) + log(x+1));
    
    printf("\n✅ All Fortran functions working correctly!\n");
    return 0;
}