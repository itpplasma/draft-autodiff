; ModuleID = 'combined_bc.ll'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str.2 = private unnamed_addr constant [12 x i8] c"f(%g) = %g\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"f'(%g) = %g (expected: %g)\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"g(%g) = %g\0A\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"g'(%g) = %g (expected: %g)\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"h(%g) = %g\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"h'(%g) = %g (expected: %g)\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [16 x i8] c"f2(%g,%g) = %g\0A\00", align 1
@.str.13 = private unnamed_addr constant [40 x i8] c"\E2\88\87f2 = (%g, %g) (expected: (%g, %g))\0A\0A\00", align 1
@.str.14 = private unnamed_addr constant [16 x i8] c"g2(%g,%g) = %g\0A\00", align 1
@.str.15 = private unnamed_addr constant [40 x i8] c"\E2\88\87g2 = (%g, %g) (expected: (%g, %g))\0A\0A\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"h2(%g,%g) = %g\0A\00", align 1
@.str.17 = private unnamed_addr constant [39 x i8] c"\E2\88\87h2 = (%g, %g) (expected: (%g, %g))\0A\00", align 1
@enzyme_dup = local_unnamed_addr global i32 0, align 4
@enzyme_dupnoneed = local_unnamed_addr global i32 0, align 4
@enzyme_out = local_unnamed_addr global i32 0, align 4
@enzyme_const = local_unnamed_addr global i32 0, align 4
@str = private unnamed_addr constant [56 x i8] c"Testing Enzyme Forward Mode with pure Fortran functions\00", align 1
@str.19 = private unnamed_addr constant [56 x i8] c"Testing Enzyme Reverse Mode with pure Fortran functions\00", align 1
@str.20 = private unnamed_addr constant [57 x i8] c"=======================================================\0A\00", align 1
@str.21 = private unnamed_addr constant [65 x i8] c"(Reverse mode tests skipped - enzyme calling convention issues)\0A\00", align 1
@str.22 = private unnamed_addr constant [36 x i8] c"Testing Multi-dimensional Gradients\00", align 1
@str.23 = private unnamed_addr constant [37 x i8] c"===================================\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPf_fortran(ptr nocapture readonly %0) local_unnamed_addr #0 {
  %2 = load double, ptr %0, align 8, !tbaa !8
  %3 = fmul contract double %2, %2
  %4 = fmul contract double %2, 2.000000e+00
  %5 = fadd contract double %3, %4
  %6 = fadd contract double %5, 1.000000e+00
  ret double %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPg_fortran(ptr nocapture readonly %0) local_unnamed_addr #0 {
  %2 = load double, ptr %0, align 8, !tbaa !14
  %3 = tail call contract double @llvm.sin.f64(double %2)
  %4 = tail call contract double @llvm.cos.f64(double %2)
  %5 = fmul contract double %3, %4
  ret double %5
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sin.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cos.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPh_fortran(ptr nocapture readonly %0) local_unnamed_addr #0 {
  %2 = load double, ptr %0, align 8, !tbaa !20
  %3 = tail call contract double @llvm.exp.f64(double %2)
  %4 = fadd contract double %2, 1.000000e+00
  %5 = tail call contract double @llvm.log.f64(double %4)
  %6 = fadd contract double %3, %5
  ret double %6
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPf2_fortran(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load double, ptr %0, align 8, !tbaa !26
  %4 = fmul contract double %3, %3
  %5 = load double, ptr %1, align 8, !tbaa !32
  %6 = fmul contract double %5, %5
  %7 = fadd contract double %4, %6
  %8 = fmul contract double %3, %5
  %9 = fadd contract double %8, %7
  ret double %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPg2_fortran(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load double, ptr %0, align 8, !tbaa !34
  %4 = tail call contract double @llvm.sin.f64(double %3)
  %5 = load double, ptr %1, align 8, !tbaa !40
  %6 = tail call contract double @llvm.cos.f64(double %5)
  %7 = fmul contract double %4, %6
  %8 = fmul contract double %3, %5
  %9 = tail call contract double @llvm.exp.f64(double %8)
  %10 = fadd contract double %7, %9
  ret double %10
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMautodiff_functionsPh2_fortran(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load double, ptr %0, align 8, !tbaa !42
  %4 = fmul contract double %3, %3
  %5 = load double, ptr %1, align 8, !tbaa !48
  %6 = fmul contract double %5, %5
  %7 = fadd contract double %4, %6
  %8 = fadd contract double %7, 1.000000e+00
  %9 = tail call contract double @llvm.log.f64(double %8)
  %10 = fmul contract double %3, %5
  %11 = fadd contract double %3, %5
  %12 = tail call contract double @llvm.sin.f64(double %11)
  %13 = fmul contract double %10, %12
  %14 = fadd contract double %13, %9
  ret double %14
}

define double @f_wrapper(double %0) #2 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !50
  %3 = call contract double @_QMautodiff_functionsPf_fortran(ptr nonnull %2)
  ret double %3
}

define double @g_wrapper(double %0) #2 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !54
  %3 = call contract double @_QMautodiff_functionsPg_fortran(ptr nonnull %2)
  ret double %3
}

define double @h_wrapper(double %0) #2 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !58
  %3 = call contract double @_QMautodiff_functionsPh_fortran(ptr nonnull %2)
  ret double %3
}

define double @f2_wrapper(double %0, double %1) #2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !62
  store double %1, ptr %3, align 8, !tbaa !62
  %5 = call contract double @_QMautodiff_functionsPf2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

define double @g2_wrapper(double %0, double %1) #2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !66
  store double %1, ptr %3, align 8, !tbaa !66
  %5 = call contract double @_QMautodiff_functionsPg2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

define double @h2_wrapper(double %0, double %1) #2 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !70
  store double %1, ptr %3, align 8, !tbaa !70
  %5 = call contract double @_QMautodiff_functionsPh2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

; Function Attrs: nounwind ssp uwtable(sync)
define noundef i32 @main() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.20)
  %3 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %4 = tail call double @f_wrapper(double noundef 2.000000e+00) #7
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef 2.000000e+00, double noundef %4)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, double noundef 2.000000e+00, double noundef %3, double noundef 6.000000e+00)
  %7 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %8 = tail call double @g_wrapper(double noundef 2.000000e+00) #7
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, double noundef 2.000000e+00, double noundef %8)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef 2.000000e+00, double noundef %7, double noundef 0xBFE4EAA606DB24C1)
  %11 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %12 = tail call double @h_wrapper(double noundef 2.000000e+00) #7
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef 2.000000e+00, double noundef %12)
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, double noundef 2.000000e+00, double noundef %11, double noundef 0x401EE3BA0E2A3303)
  %15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.19)
  %16 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.20)
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.21)
  %18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.22)
  %19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.23)
  %20 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #7
  %21 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %22 = tail call double @f2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #7
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %22)
  %24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, double noundef %20, double noundef %21, double noundef 4.000000e+00, double noundef 5.000000e+00)
  %25 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #7
  %26 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %27 = tail call double @g2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #7
  %28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %27)
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, double noundef %25, double noundef %26, double noundef 0x402D1B45D35E56B4, double noundef 0x401A7EE1EBF12EE8)
  %30 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #7
  %31 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #7
  %32 = tail call double @h2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #7
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %32)
  %34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.17, double noundef %30, double noundef %31, double noundef 0xBFF5D4A14DC2DB26, double noundef 0xBFF2C1530624607C)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

declare double @__enzyme_fwddiff(ptr noundef, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "frame-pointer"="non-leaf" "target-cpu"="apple-m1" "target-features"="+zcm,+zcz,+v8.4a,+aes,+altnzcv,+ccdp,+ccpp,+complxnum,+crc,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "target-cpu"="apple-m1" "target-features"="+zcm,+zcz,+v8.4a,+aes,+altnzcv,+ccdp,+ccpp,+complxnum,+crc,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs" }
attributes #3 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nofree nounwind }
attributes #5 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nounwind }

!llvm.ident = !{!0, !0, !1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}

!0 = !{!"Homebrew flang version 20.1.8 (https://github.com/Homebrew/homebrew-core/issues)"}
!1 = !{!"Homebrew clang version 19.1.7"}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 5]}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!9, !9, i64 0}
!9 = !{!"dummy arg data/_QMautodiff_functionsFf_fortranEx", !10, i64 0}
!10 = !{!"dummy arg data", !11, i64 0}
!11 = !{!"any data access", !12, i64 0}
!12 = !{!"any access", !13, i64 0}
!13 = !{!"Flang function root _QMautodiff_functionsPf_fortran"}
!14 = !{!15, !15, i64 0}
!15 = !{!"dummy arg data/_QMautodiff_functionsFg_fortranEx", !16, i64 0}
!16 = !{!"dummy arg data", !17, i64 0}
!17 = !{!"any data access", !18, i64 0}
!18 = !{!"any access", !19, i64 0}
!19 = !{!"Flang function root _QMautodiff_functionsPg_fortran"}
!20 = !{!21, !21, i64 0}
!21 = !{!"dummy arg data/_QMautodiff_functionsFh_fortranEx", !22, i64 0}
!22 = !{!"dummy arg data", !23, i64 0}
!23 = !{!"any data access", !24, i64 0}
!24 = !{!"any access", !25, i64 0}
!25 = !{!"Flang function root _QMautodiff_functionsPh_fortran"}
!26 = !{!27, !27, i64 0}
!27 = !{!"dummy arg data/_QMautodiff_functionsFf2_fortranEx", !28, i64 0}
!28 = !{!"dummy arg data", !29, i64 0}
!29 = !{!"any data access", !30, i64 0}
!30 = !{!"any access", !31, i64 0}
!31 = !{!"Flang function root _QMautodiff_functionsPf2_fortran"}
!32 = !{!33, !33, i64 0}
!33 = !{!"dummy arg data/_QMautodiff_functionsFf2_fortranEy", !28, i64 0}
!34 = !{!35, !35, i64 0}
!35 = !{!"dummy arg data/_QMautodiff_functionsFg2_fortranEx", !36, i64 0}
!36 = !{!"dummy arg data", !37, i64 0}
!37 = !{!"any data access", !38, i64 0}
!38 = !{!"any access", !39, i64 0}
!39 = !{!"Flang function root _QMautodiff_functionsPg2_fortran"}
!40 = !{!41, !41, i64 0}
!41 = !{!"dummy arg data/_QMautodiff_functionsFg2_fortranEy", !36, i64 0}
!42 = !{!43, !43, i64 0}
!43 = !{!"dummy arg data/_QMautodiff_functionsFh2_fortranEx", !44, i64 0}
!44 = !{!"dummy arg data", !45, i64 0}
!45 = !{!"any data access", !46, i64 0}
!46 = !{!"any access", !47, i64 0}
!47 = !{!"Flang function root _QMautodiff_functionsPh2_fortran"}
!48 = !{!49, !49, i64 0}
!49 = !{!"dummy arg data/_QMautodiff_functionsFh2_fortranEy", !44, i64 0}
!50 = !{!51, !51, i64 0}
!51 = !{!"any data access", !52, i64 0}
!52 = !{!"any access", !53, i64 0}
!53 = !{!"Flang function root f_wrapper"}
!54 = !{!55, !55, i64 0}
!55 = !{!"any data access", !56, i64 0}
!56 = !{!"any access", !57, i64 0}
!57 = !{!"Flang function root g_wrapper"}
!58 = !{!59, !59, i64 0}
!59 = !{!"any data access", !60, i64 0}
!60 = !{!"any access", !61, i64 0}
!61 = !{!"Flang function root h_wrapper"}
!62 = !{!63, !63, i64 0}
!63 = !{!"any data access", !64, i64 0}
!64 = !{!"any access", !65, i64 0}
!65 = !{!"Flang function root f2_wrapper"}
!66 = !{!67, !67, i64 0}
!67 = !{!"any data access", !68, i64 0}
!68 = !{!"any access", !69, i64 0}
!69 = !{!"Flang function root g2_wrapper"}
!70 = !{!71, !71, i64 0}
!71 = !{!"any data access", !72, i64 0}
!72 = !{!"any access", !73, i64 0}
!73 = !{!"Flang function root h2_wrapper"}
