! Fortran C wrappers for enzyme autodiff
module fortran_wrappers
  use, intrinsic :: iso_c_binding
  use autodiff_functions
  implicit none

contains

  ! C wrapper for f_fortran(x) = x^2 + 2x + 1
  function f_wrapper(x) result(y) bind(C, name="f_wrapper")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = f_fortran(x)
  end function f_wrapper

  ! C wrapper for g_fortran(x) = sin(x) * cos(x)  
  function g_wrapper(x) result(y) bind(C, name="g_wrapper")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = g_fortran(x)
  end function g_wrapper

  ! C wrapper for h_fortran(x) = exp(x) + log(x + 1)
  function h_wrapper(x) result(y) bind(C, name="h_wrapper")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = h_fortran(x)
  end function h_wrapper

  ! Multi-dimensional wrappers
  ! C wrapper for f2_fortran(x,y) = x^2 + y^2 + xy
  function f2_wrapper(x, y) result(z) bind(C, name="f2_wrapper")
    real(c_double), intent(in), value :: x, y
    real(c_double) :: z
    z = f2_fortran(x, y)
  end function f2_wrapper

  ! C wrapper for g2_fortran(x,y) = sin(x) * cos(y) + exp(x*y)
  function g2_wrapper(x, y) result(z) bind(C, name="g2_wrapper")
    real(c_double), intent(in), value :: x, y
    real(c_double) :: z
    z = g2_fortran(x, y)
  end function g2_wrapper

  ! C wrapper for h2_fortran(x,y) = log(x^2 + y^2 + 1) + x*y*sin(x+y)
  function h2_wrapper(x, y) result(z) bind(C, name="h2_wrapper")
    real(c_double), intent(in), value :: x, y
    real(c_double) :: z
    z = h2_fortran(x, y)
  end function h2_wrapper

end module fortran_wrappers