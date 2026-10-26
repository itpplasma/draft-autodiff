!mod$ v1 sum:4a57e13c3ce9251f
!need$ bdb55201be616191 i iso_c_binding
!need$ ff43de342ab456c8 n autodiff_functions
module fortran_wrappers
use,intrinsic::iso_c_binding,only:c_associated
use,intrinsic::iso_c_binding,only:c_funloc
use,intrinsic::iso_c_binding,only:c_funptr
use,intrinsic::iso_c_binding,only:c_f_pointer
use,intrinsic::iso_c_binding,only:c_loc
use,intrinsic::iso_c_binding,only:c_null_funptr
use,intrinsic::iso_c_binding,only:c_null_ptr
use,intrinsic::iso_c_binding,only:c_ptr
use,intrinsic::iso_c_binding,only:c_sizeof
use,intrinsic::iso_c_binding,only:operator(==)
use,intrinsic::iso_c_binding,only:operator(/=)
use,intrinsic::iso_c_binding,only:c_int8_t
use,intrinsic::iso_c_binding,only:c_int16_t
use,intrinsic::iso_c_binding,only:c_int32_t
use,intrinsic::iso_c_binding,only:c_int64_t
use,intrinsic::iso_c_binding,only:c_int128_t
use,intrinsic::iso_c_binding,only:c_int
use,intrinsic::iso_c_binding,only:c_short
use,intrinsic::iso_c_binding,only:c_long
use,intrinsic::iso_c_binding,only:c_long_long
use,intrinsic::iso_c_binding,only:c_signed_char
use,intrinsic::iso_c_binding,only:c_size_t
use,intrinsic::iso_c_binding,only:c_intmax_t
use,intrinsic::iso_c_binding,only:c_intptr_t
use,intrinsic::iso_c_binding,only:c_ptrdiff_t
use,intrinsic::iso_c_binding,only:c_int_least8_t
use,intrinsic::iso_c_binding,only:c_int_fast8_t
use,intrinsic::iso_c_binding,only:c_int_least16_t
use,intrinsic::iso_c_binding,only:c_int_fast16_t
use,intrinsic::iso_c_binding,only:c_int_least32_t
use,intrinsic::iso_c_binding,only:c_int_fast32_t
use,intrinsic::iso_c_binding,only:c_int_least64_t
use,intrinsic::iso_c_binding,only:c_int_fast64_t
use,intrinsic::iso_c_binding,only:c_int_least128_t
use,intrinsic::iso_c_binding,only:c_int_fast128_t
use,intrinsic::iso_c_binding,only:c_float
use,intrinsic::iso_c_binding,only:c_double
use,intrinsic::iso_c_binding,only:c_long_double
use,intrinsic::iso_c_binding,only:c_float_complex
use,intrinsic::iso_c_binding,only:c_double_complex
use,intrinsic::iso_c_binding,only:c_long_double_complex
use,intrinsic::iso_c_binding,only:c_bool
use,intrinsic::iso_c_binding,only:c_char
use,intrinsic::iso_c_binding,only:c_null_char
use,intrinsic::iso_c_binding,only:c_alert
use,intrinsic::iso_c_binding,only:c_backspace
use,intrinsic::iso_c_binding,only:c_form_feed
use,intrinsic::iso_c_binding,only:c_new_line
use,intrinsic::iso_c_binding,only:c_carriage_return
use,intrinsic::iso_c_binding,only:c_horizontal_tab
use,intrinsic::iso_c_binding,only:c_vertical_tab
use,intrinsic::iso_c_binding,only:c_float128
use,intrinsic::iso_c_binding,only:c_float128_complex
use,intrinsic::iso_c_binding,only:c_uint8_t
use,intrinsic::iso_c_binding,only:c_uint16_t
use,intrinsic::iso_c_binding,only:c_uint32_t
use,intrinsic::iso_c_binding,only:c_uint64_t
use,intrinsic::iso_c_binding,only:c_uint128_t
use,intrinsic::iso_c_binding,only:c_unsigned_char
use,intrinsic::iso_c_binding,only:c_unsigned_short
use,intrinsic::iso_c_binding,only:c_unsigned
use,intrinsic::iso_c_binding,only:c_unsigned_long
use,intrinsic::iso_c_binding,only:c_unsigned_long_long
use,intrinsic::iso_c_binding,only:c_uintmax_t
use,intrinsic::iso_c_binding,only:c_uint_fast8_t
use,intrinsic::iso_c_binding,only:c_uint_fast16_t
use,intrinsic::iso_c_binding,only:c_uint_fast32_t
use,intrinsic::iso_c_binding,only:c_uint_fast64_t
use,intrinsic::iso_c_binding,only:c_uint_fast128_t
use,intrinsic::iso_c_binding,only:c_uint_least8_t
use,intrinsic::iso_c_binding,only:c_uint_least16_t
use,intrinsic::iso_c_binding,only:c_uint_least32_t
use,intrinsic::iso_c_binding,only:c_uint_least64_t
use,intrinsic::iso_c_binding,only:c_uint_least128_t
use,intrinsic::iso_c_binding,only:c_f_procpointer
use autodiff_functions,only:f_fortran
use autodiff_functions,only:g_fortran
use autodiff_functions,only:h_fortran
use autodiff_functions,only:f2_fortran
use autodiff_functions,only:g2_fortran
use autodiff_functions,only:h2_fortran
contains
function f_wrapper(x) bind(c,name="f_wrapper") result(y)
real(8),intent(in),value::x
real(8)::y
end
function g_wrapper(x) bind(c,name="g_wrapper") result(y)
real(8),intent(in),value::x
real(8)::y
end
function h_wrapper(x) bind(c,name="h_wrapper") result(y)
real(8),intent(in),value::x
real(8)::y
end
function f2_wrapper(x,y) bind(c,name="f2_wrapper") result(z)
real(8),intent(in),value::x
real(8),intent(in),value::y
real(8)::z
end
function g2_wrapper(x,y) bind(c,name="g2_wrapper") result(z)
real(8),intent(in),value::x
real(8),intent(in),value::y
real(8)::z
end
function h2_wrapper(x,y) bind(c,name="h2_wrapper") result(z)
real(8),intent(in),value::x
real(8),intent(in),value::y
real(8)::z
end
end
