#include <stdio.h>
#include <math.h>

// Simple test functions in C
double f(double x) {
    return x * x + 2.0 * x + 1.0;
}

double g(double x) {
    return sin(x) * cos(x);
}

double h(double x) {
    return exp(x) + log(x + 1.0);
}

// Enzyme autodiff function declaration
extern double __enzyme_autodiff(void*, double);

int main() {
    double x = 2.0;
    
    // Test function f(x) = x^2 + 2x + 1, derivative should be 2x + 2 = 6
    printf("Testing f(x) = x^2 + 2x + 1 at x = %.1f\n", x);
    printf("f(%.1f) = %.6f\n", x, f(x));
    printf("f'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(f, x), 2*x + 2);
    
    // Test function g(x) = sin(x) * cos(x), derivative should be cos^2(x) - sin^2(x)
    printf("\nTesting g(x) = sin(x) * cos(x) at x = %.1f\n", x);
    printf("g(%.1f) = %.6f\n", x, g(x));
    printf("g'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(g, x), cos(x)*cos(x) - sin(x)*sin(x));
    
    // Test function h(x) = exp(x) + log(x+1), derivative should be exp(x) + 1/(x+1)
    printf("\nTesting h(x) = exp(x) + log(x+1) at x = %.1f\n", x);
    printf("h(%.1f) = %.6f\n", x, h(x));
    printf("h'(%.1f) = %.6f (expected: %.6f)\n", x, __enzyme_autodiff(h, x), exp(x) + 1.0/(x+1));
    
    return 0;
}