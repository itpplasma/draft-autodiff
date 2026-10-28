# draft-autodiff

Exploratory repository for automatic differentiation of the group's Fortran
codes. It started as a copy of the [code](https://github.com/itpplasma/code)
meta-repository; the experiment itself is in
[draft-autodiff/](draft-autodiff/README.md).

Status: draft; not maintained as a development environment.

## Contents

- [draft-autodiff/](draft-autodiff/README.md): test of compiling Fortran to
  LLVM IR with Flang and differentiating with Enzyme
- `NEO-2`, `SIMPLE`, `libneo`, `fortplotlib`, `fpm`, `sfincs`, `assi`,
  `benchmark_orbit`: code repositories recorded as Git submodule commits.
  There is no `.gitmodules` file, so `git submodule update` does not fetch them;
  clone the repositories separately if needed.
- `scripts/`, `modules/`, `images/`, `activate.sh`, `requirements.txt`,
  `tests/`: setup scripts, environment modules, container images, shell
  activation and integration tests copied from the code meta-repository (state
  of mid-2025). The maintained versions are in
  [itpplasma/code](https://github.com/itpplasma/code).

## Running the experiment

The build script assumes Homebrew on macOS with Flang, LLVM 19 and Enzyme
0.0.187 installed at their Homebrew paths:

    cd draft-autodiff
    ./build.sh

See [draft-autodiff/README.md](draft-autodiff/README.md) for what it does and
what was found.
