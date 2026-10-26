#include <stdio.h>
#include <math.h>

// Enzyme autodiff declarations
int enzyme_dup;
int enzyme_const;
double __enzyme_autodiff(void*, ...);

// Simple test functions
double f_test(double x) {
    return x * x + 2.0 * x + 1.0;
}

double g_test(double x) {
    return sin(x) * cos(x);
}

int main() {
    double x = 2.0;
    double dx = 1.0;
    
    printf("Testing Enzyme autodiff with simple C functions\n");
    printf("===============================================\n\n");
    
    // Test f(x) = x^2 + 2x + 1, f'(x) = 2x + 2
    double f_val = f_test(x);
    double df_dx = __enzyme_autodiff((void*)f_test, enzyme_dup, x, dx);
    printf("f(%g) = %g\n", x, f_val);
    printf("f'(%g) = %g (expected: %g)\n\n", x, df_dx, 2*x + 2);
    
    // Test g(x) = sin(x)*cos(x), g'(x) = cos(2x)
    double g_val = g_test(x);
    double dg_dx = __enzyme_autodiff((void*)g_test, enzyme_dup, x, dx);
    printf("g(%g) = %g\n", x, g_val);
    printf("g'(%g) = %g (expected: %g)\n", x, dg_dx, cos(2*x));
    
    return 0;
}