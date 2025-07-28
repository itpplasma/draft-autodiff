! Fortran functions with ISO C binding for autodiff testing
module autodiff_functions
  use, intrinsic :: iso_c_binding
  implicit none

contains

  ! f(x) = x^2 + 2x + 1
  function f_fortran(x) result(y) bind(C, name="f_fortran")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = x * x + 2.0_c_double * x + 1.0_c_double
  end function f_fortran

  ! g(x) = sin(x) * cos(x)  
  function g_fortran(x) result(y) bind(C, name="g_fortran")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = sin(x) * cos(x)
  end function g_fortran

  ! h(x) = exp(x) + log(x + 1)
  function h_fortran(x) result(y) bind(C, name="h_fortran")
    real(c_double), intent(in), value :: x
    real(c_double) :: y
    y = exp(x) + log(x + 1.0_c_double)
  end function h_fortran

end module autodiff_functions