# Flang and Enzyme test

A small test of whether Fortran code compiled with Flang can be differentiated
with [Enzyme](https://enzyme.mit.edu).

## What it does

`build.sh` runs three steps:

1. Compile the Fortran functions in `test_functions.f90` to LLVM IR
   (`test_functions.ll`) with `flang -S -emit-llvm`.
2. Compile `fortran_equivalent.c` together with `test_functions.ll` with
   Clang and the Enzyme plugin.
3. Run the resulting program `fortran_equivalent`.

The program evaluates the three test functions

- f(x) = x² + 2x + 1
- g(x) = sin(x) cos(x)
- h(x) = exp(x) + ln(x + 1)

both through the Flang-compiled Fortran (`f_`, `g_`, `h_`) and through
hand-written C equivalents, and compares Enzyme derivatives of the C
equivalents at x = 2 with the analytical derivatives.

## Findings

- Flang produces LLVM IR for the Fortran functions that links with C code.
- Enzyme differentiates the C equivalents correctly.
- Enzyme was not applied to the Fortran functions themselves. Obstacles noted
  were the Fortran calling convention (arguments by reference, trailing
  underscore in symbol names) and single-precision `real` versus C `double`.
  `fortran_bridge.c` and `test_driver.c` sketch C wrappers around the Fortran
  symbols for this purpose. `test_functions_autodiff.ll` differs from
  `test_functions.ll` only in the module name and contains no derivative code.

Differentiating the Fortran IR directly, for example through such wrappers,
remains open.

## Environment

Tested on macOS ARM64 with Flang 20.1.8, LLVM 19.1.7 and Enzyme 0.0.187 from
Homebrew. `build.sh` uses the Homebrew installation paths of LLVM and Enzyme;
adjust them for other systems.

## Files

- `test_functions.f90`, `test_functions.ll`: Fortran test functions and their IR
- `fortran_equivalent.c`: C equivalents, comparison and Enzyme test
- `fortran_bridge.c`, `test_driver.c`: C wrappers around the Fortran symbols
- `simple_test.c`: Enzyme test on plain C functions
- `DESIGN.md`, `BACKLOG.md`: original plan for the test
