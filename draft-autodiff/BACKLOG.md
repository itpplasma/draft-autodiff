# Draft Autodiff Simple Backlog

## Task 1: Environment Setup (2-4 hours)
- Install/verify flang compiler works: `flang --version`
- Install/build enzyme library with LLVM
- Test basic flang compilation: `flang hello.f90 -o hello`
- Test basic enzyme on C code first

## Task 2: Simple Fortran Test Functions (1-2 hours)
Write basic test functions in Fortran:
```fortran
! test_functions.f90
function f(x) result(y)
  real :: x, y
  y = x * x + 2.0 * x + 1.0
end function

function g(x) result(y)
  real :: x, y  
  y = sin(x) * cos(x)
end function
```

## Task 3: Generate LLVM IR (1 hour)
- Use flang to generate IR: `flang -S -emit-llvm test_functions.f90`
- Examine the generated `.ll` file
- Understand the IR structure for Fortran functions

## Task 4: Apply Enzyme (2-4 hours)
- Try enzyme on the generated IR: `opt -load EnzymePlugin.so -enzyme test_functions.ll`
- Debug any issues with Fortran IR compatibility
- May need to add enzyme annotations to the IR

## Task 5: Create Working Pipeline (2-3 hours)
- Write simple build script that chains: fortran → IR → enzyme → executable
- Test end-to-end compilation
- Verify the differentiated functions work

## Task 6: Validation (1-2 hours)
- Write simple test program that calls both original and differentiated functions
- Compare with analytical derivatives: f'(x) = 2x + 2, g'(x) = cos²(x) - sin²(x)
- Verify numerical accuracy

## Task 7: Documentation (1 hour)
- Write simple README with usage instructions
- Document any enzyme annotations needed for Fortran
- Note limitations and gotchas

## Potential Issues to Investigate
1. **Enzyme annotations**: May need `__enzyme_autodiff` calls in the IR
2. **Calling conventions**: Fortran vs C function calls
3. **Array handling**: If using Fortran arrays
4. **Name mangling**: Fortran function names in IR

**Total realistic effort: 10-20 hours**
**This is a proof-of-concept, not production system**