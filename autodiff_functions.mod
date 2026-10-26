!mod$ v1 sum:ff43de342ab456c8
module autodiff_functions
contains
function f_fortran(x) result(y)
real(8),intent(in)::x
real(8)::y
end
function g_fortran(x) result(y)
real(8),intent(in)::x
real(8)::y
end
function h_fortran(x) result(y)
real(8),intent(in)::x
real(8)::y
end
function f2_fortran(x,y) result(z)
real(8),intent(in)::x
real(8),intent(in)::y
real(8)::z
end
function g2_fortran(x,y) result(z)
real(8),intent(in)::x
real(8),intent(in)::y
real(8)::z
end
function h2_fortran(x,y) result(z)
real(8),intent(in)::x
real(8),intent(in)::y
real(8)::z
end
end
