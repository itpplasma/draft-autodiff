# Makefile for Fortran + Enzyme Autodiff Test
# Requires: flang-new, clang with enzyme plugin

# Compiler settings
FLANG = flang-new
CLANG = $(shell brew --prefix llvm@19)/bin/clang
LLVM_LINK = $(shell brew --prefix llvm@19)/bin/llvm-link
ENZYME_INCLUDE = /opt/homebrew/Cellar/enzyme/0.0.187/include
ENZYME_PLUGIN = /opt/homebrew/Cellar/enzyme/0.0.187/lib/ClangEnzyme-19.dylib

# Files
FORTRAN_CORE = test_functions.f90
FORTRAN_WRAPPERS = fortran_wrappers.f90
MAIN_SRC = main.c
TARGET = autodiff_test

# Build flags
FFLAGS = -O2
CFLAGS = -O2 -I$(ENZYME_INCLUDE) -fplugin=$(ENZYME_PLUGIN) -fno-vectorize -fno-slp-vectorize
LDFLAGS = -lm -L/opt/homebrew/lib/gcc/current -lgfortran

.PHONY: all clean test

all: $(TARGET)

# Compile everything to LLVM IR first, then link with llvm-link
test_functions.ll: $(FORTRAN_CORE)
	$(FLANG) -S -emit-llvm $(FFLAGS) $< -o $@

fortran_wrappers.ll: $(FORTRAN_WRAPPERS) test_functions.ll
	$(FLANG) -S -emit-llvm $(FFLAGS) $< -o $@

# Compile main.c to LLVM IR
main.ll: $(MAIN_SRC)
	$(CLANG) -S -emit-llvm -O2 -I$(ENZYME_INCLUDE) $< -o $@

# Combine all LLVM IR into one file and convert to text format
combined.ll: test_functions.ll fortran_wrappers.ll main.ll
	$(LLVM_LINK) $^ -o combined_bc.ll
	$(shell brew --prefix llvm@19)/bin/llvm-dis combined_bc.ll -o $@

# Apply enzyme using opt and LLVMEnzyme, then compile
enzyme_processed.ll: combined.ll
	$(shell brew --prefix llvm@19)/bin/opt $< --load-pass-plugin=/opt/homebrew/Cellar/enzyme/0.0.187/lib/LLVMEnzyme-19.dylib -passes=enzyme -o $@ -S

$(TARGET): enzyme_processed.ll
	$(CLANG) -x ir -O2 -fno-vectorize -fno-slp-vectorize $< -o $@ $(LDFLAGS)

test: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) *.o *.mod *.ll combined.ll combined_bc.ll main.ll enzyme_processed.ll

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Build the autodiff test program"
	@echo "  test    - Build and run the test"
	@echo "  clean   - Remove all generated files"
	@echo "  help    - Show this help"