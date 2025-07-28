! Simple Fortran functions for autodiff testing
function f(x) result(y)
  implicit none
  real :: x, y
  y = x * x + 2.0 * x + 1.0
end function f

function g(x) result(y)
  implicit none
  real :: x, y
  y = sin(x) * cos(x)
end function g

function h(x) result(y)
  implicit none
  real :: x, y
  y = exp(x) + log(x + 1.0)
end function h