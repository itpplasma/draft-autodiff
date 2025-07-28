# Draft Autodiff Simple Design

## Overview
Simple test program: Use flang to compile Fortran → LLVM IR, then apply enzyme autodifferentiation.

## Simple Architecture

### Basic Flow
1. **Fortran source** → flang → **LLVM IR**
2. **LLVM IR** → enzyme pass → **differentiated IR**  
3. **Compile and run** differentiated program

### Components Needed
- Flang compiler (already exists)
- Enzyme library (already exists)
- Simple build script to chain them together
- Test Fortran functions

## Implementation Plan
Just need to:
1. Write simple Fortran test functions
2. Use flang to generate IR: `flang -S -emit-llvm test.f90`
3. Apply enzyme: `opt -load EnzymePlugin.so -enzyme test.ll`
4. Compile result: `clang differentiated.ll -o test`
5. Run and verify derivatives are correct

## Actual Difficulty
The main challenges are:
- **Getting enzyme to work with Fortran IR** - enzyme was designed for C/C++, may need annotations
- **Fortran calling conventions** - different from C, may need wrapper functions
- **Memory layout** - Fortran arrays vs C arrays
- **Build system integration** - getting all the pieces to work together

This is more like a weekend project, not a 240-hour enterprise system.