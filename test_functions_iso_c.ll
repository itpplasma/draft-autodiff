; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%_QM__fortran_builtinsT__builtin_c_funptr = type { i64 }
%_QM__fortran_builtinsT__builtin_c_ptr = type { i64 }
%_QM__fortran_type_infoTderivedtype = type { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8 }, i64, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, i32, i8, i8, i8, i8, [4 x i8] }
%_QM__fortran_type_infoTbinding = type { %_QM__fortran_builtinsT__builtin_c_funptr, { ptr, i64, i32, i8, i8, i8, i8 } }
%_QM__fortran_type_infoTcomponent = type { { ptr, i64, i32, i8, i8, i8, i8 }, i8, i8, i8, i8, [4 x i8], i64, %_QM__fortran_type_infoTvalue, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] }, %_QM__fortran_builtinsT__builtin_c_ptr }
%_QM__fortran_type_infoTvalue = type { i8, [7 x i8], i64 }
%_QM__fortran_type_infoTprocptrcomponent = type { { ptr, i64, i32, i8, i8, i8, i8 }, i64, %_QM__fortran_builtinsT__builtin_c_funptr }
%_QM__fortran_type_infoTspecialbinding = type { i8, i8, i8, i8, [4 x i8], %_QM__fortran_builtinsT__builtin_c_funptr }

@_QMiso_c_bindingECc_alert = external constant [1 x i8]
@_QMiso_c_bindingECc_backspace = external constant [1 x i8]
@_QMiso_c_bindingECc_bool = external constant i32
@_QMiso_c_bindingECc_carriage_return = external constant [1 x i8]
@_QMiso_c_bindingECc_char = external constant i32
@_QMiso_c_bindingECc_double = external constant i32
@_QMiso_c_bindingECc_double_complex = external constant i32
@_QMiso_c_bindingECc_float = external constant i32
@_QMiso_c_bindingECc_float128 = external constant i32
@_QMiso_c_bindingECc_float128_complex = external constant i32
@_QMiso_c_bindingECc_float_complex = external constant i32
@_QMiso_c_bindingECc_form_feed = external constant [1 x i8]
@_QMiso_c_bindingECc_horizontal_tab = external constant [1 x i8]
@_QMiso_c_bindingECc_int = external constant i32
@_QMiso_c_bindingECc_int128_t = external constant i32
@_QMiso_c_bindingECc_int16_t = external constant i32
@_QMiso_c_bindingECc_int32_t = external constant i32
@_QMiso_c_bindingECc_int64_t = external constant i32
@_QMiso_c_bindingECc_int8_t = external constant i32
@_QMiso_c_bindingECc_int_fast128_t = external constant i32
@_QMiso_c_bindingECc_int_fast16_t = external constant i32
@_QMiso_c_bindingECc_int_fast32_t = external constant i32
@_QMiso_c_bindingECc_int_fast64_t = external constant i32
@_QMiso_c_bindingECc_int_fast8_t = external constant i32
@_QMiso_c_bindingECc_int_least128_t = external constant i32
@_QMiso_c_bindingECc_int_least16_t = external constant i32
@_QMiso_c_bindingECc_int_least32_t = external constant i32
@_QMiso_c_bindingECc_int_least64_t = external constant i32
@_QMiso_c_bindingECc_int_least8_t = external constant i32
@_QMiso_c_bindingECc_intmax_t = external constant i32
@_QMiso_c_bindingECc_intptr_t = external constant i32
@_QMiso_c_bindingECc_long = external constant i32
@_QMiso_c_bindingECc_long_double = external constant i32
@_QMiso_c_bindingECc_long_double_complex = external constant i32
@_QMiso_c_bindingECc_long_long = external constant i32
@_QMiso_c_bindingECc_new_line = external constant [1 x i8]
@_QMiso_c_bindingECc_null_char = external constant [1 x i8]
@_QM__fortran_builtinsEC__builtin_c_null_funptr = external constant %_QM__fortran_builtinsT__builtin_c_funptr
@_QM__fortran_builtinsEC__builtin_c_null_ptr = external constant %_QM__fortran_builtinsT__builtin_c_ptr
@_QMiso_c_bindingECc_ptrdiff_t = external constant i32
@_QMiso_c_bindingECc_short = external constant i32
@_QMiso_c_bindingECc_signed_char = external constant i32
@_QMiso_c_bindingECc_size_t = external constant i32
@_QMiso_c_bindingECc_uint128_t = external constant i32
@_QMiso_c_bindingECc_uint16_t = external constant i32
@_QMiso_c_bindingECc_uint32_t = external constant i32
@_QMiso_c_bindingECc_uint64_t = external constant i32
@_QMiso_c_bindingECc_uint8_t = external constant i32
@_QMiso_c_bindingECc_uint_fast128_t = external constant i32
@_QMiso_c_bindingECc_uint_fast16_t = external constant i32
@_QMiso_c_bindingECc_uint_fast32_t = external constant i32
@_QMiso_c_bindingECc_uint_fast64_t = external constant i32
@_QMiso_c_bindingECc_uint_fast8_t = external constant i32
@_QMiso_c_bindingECc_uint_least128_t = external constant i32
@_QMiso_c_bindingECc_uint_least16_t = external constant i32
@_QMiso_c_bindingECc_uint_least32_t = external constant i32
@_QMiso_c_bindingECc_uint_least64_t = external constant i32
@_QMiso_c_bindingECc_uint_least8_t = external constant i32
@_QMiso_c_bindingECc_uintmax_t = external constant i32
@_QMiso_c_bindingECc_unsigned = external constant i32
@_QMiso_c_bindingECc_unsigned_char = external constant i32
@_QMiso_c_bindingECc_unsigned_long = external constant i32
@_QMiso_c_bindingECc_unsigned_long_long = external constant i32
@_QMiso_c_bindingECc_unsigned_short = external constant i32
@_QMiso_c_bindingECc_vertical_tab = external constant [1 x i8]
@_QM__fortran_builtinsEXdtX__builtin_c_funptr = linkonce_odr constant %_QM__fortran_type_infoTderivedtype { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTbinding, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTbinding, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__builtin_c_funptr, i64 mul (i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i64 18), i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i64 8, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTderivedtype, ptr null, i32 1) to i64), i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 10, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 1) to i64)]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 7, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr @_QM__fortran_builtinsEXcX__builtin_c_funptr, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTcomponent, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 0, i64 1, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTcomponent, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTprocptrcomponent, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTprocptrcomponent, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTspecialbinding, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTspecialbinding, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, i32 0, i8 0, i8 1, i8 1, i8 1, [4 x i8] undef }
@_QM__fortran_builtinsEXnX__builtin_c_funptr = linkonce_odr constant [18 x i8] c"__builtin_c_funptr"
@_QM__fortran_builtinsEXcX__builtin_c_funptr = linkonce_odr constant [1 x %_QM__fortran_type_infoTcomponent] [%_QM__fortran_type_infoTcomponent { { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__address, i64 mul (i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i64 9), i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i8 1, i8 0, i8 8, i8 0, [4 x i8] undef, i64 0, %_QM__fortran_type_infoTvalue { i8 1, [7 x i8] undef, i64 0 }, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTderivedtype, ptr null, i32 1) to i64), i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64), i32 20240719, i8 2, i8 42, i8 1, i8 1, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]], ptr null, [1 x i64] zeroinitializer }, %_QM__fortran_builtinsT__builtin_c_ptr zeroinitializer }]
@_QM__fortran_builtinsEXnX__address = linkonce_odr constant [9 x i8] c"__address"
@_QM__fortran_builtinsEXdtX__builtin_c_ptr = linkonce_odr constant %_QM__fortran_type_infoTderivedtype { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTbinding, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTbinding, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__builtin_c_ptr, i64 mul (i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i64 15), i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i64 8, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTderivedtype, ptr null, i32 1) to i64), i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 10, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 1) to i64)]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 7, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr @_QM__fortran_builtinsEXcX__builtin_c_ptr, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTcomponent, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 0, i64 1, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTcomponent, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTprocptrcomponent, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTprocptrcomponent, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTspecialbinding, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTspecialbinding, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, i32 0, i8 0, i8 1, i8 1, i8 1, [4 x i8] undef }
@_QM__fortran_builtinsEXnX__builtin_c_ptr = linkonce_odr constant [15 x i8] c"__builtin_c_ptr"
@_QM__fortran_builtinsEXcX__builtin_c_ptr = linkonce_odr constant [1 x %_QM__fortran_type_infoTcomponent] [%_QM__fortran_type_infoTcomponent { { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__address, i64 mul (i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), i64 9), i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i8 1, i8 0, i8 8, i8 0, [4 x i8] undef, i64 0, %_QM__fortran_type_infoTvalue { i8 1, [7 x i8] undef, i64 0 }, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTderivedtype, ptr null, i32 1) to i64), i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64), i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64)]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64), i32 20240719, i8 2, i8 42, i8 1, i8 1, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (%_QM__fortran_type_infoTvalue, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]], ptr null, [1 x i64] zeroinitializer }, %_QM__fortran_builtinsT__builtin_c_ptr zeroinitializer }]

define double @f_fortran(double %0) #0 {
  %2 = alloca double, i64 1, align 8
  %3 = alloca double, i64 1, align 8
  store double %0, ptr %3, align 8
  %4 = load double, ptr %3, align 8
  %5 = fmul contract double %4, %4
  %6 = fmul contract double %4, 2.000000e+00
  %7 = fadd contract double %5, %6
  %8 = fadd contract double %7, 1.000000e+00
  store double %8, ptr %2, align 8
  %9 = load double, ptr %2, align 8
  ret double %9
}

define double @g_fortran(double %0) #0 {
  %2 = alloca double, i64 1, align 8
  %3 = alloca double, i64 1, align 8
  store double %0, ptr %3, align 8
  %4 = load double, ptr %3, align 8
  %5 = call contract double @llvm.sin.f64(double %4)
  %6 = call contract double @llvm.cos.f64(double %4)
  %7 = fmul contract double %5, %6
  store double %7, ptr %2, align 8
  %8 = load double, ptr %2, align 8
  ret double %8
}

define double @h_fortran(double %0) #0 {
  %2 = alloca double, i64 1, align 8
  %3 = alloca double, i64 1, align 8
  store double %0, ptr %3, align 8
  %4 = load double, ptr %3, align 8
  %5 = call contract double @llvm.exp.f64(double %4)
  %6 = fadd contract double %4, 1.000000e+00
  %7 = call contract double @llvm.log.f64(double %6)
  %8 = fadd contract double %5, %7
  store double %8, ptr %2, align 8
  %9 = load double, ptr %2, align 8
  ret double %9
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sin.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cos.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log.f64(double) #1

attributes #0 = { "frame-pointer"="non-leaf" "target-cpu"="apple-m1" "target-features"="+zcm,+zcz,+v8.4a,+aes,+altnzcv,+ccdp,+ccpp,+complxnum,+crc,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{!"Homebrew flang version 20.1.8 (https://github.com/Homebrew/homebrew-core/issues)"}
