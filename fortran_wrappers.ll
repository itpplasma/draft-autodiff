; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

define double @f_wrapper(double %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !3
  %3 = call contract double @_QMautodiff_functionsPf_fortran(ptr nonnull %2)
  ret double %3
}

define double @g_wrapper(double %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !7
  %3 = call contract double @_QMautodiff_functionsPg_fortran(ptr nonnull %2)
  ret double %3
}

define double @h_wrapper(double %0) local_unnamed_addr #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8, !tbaa !11
  %3 = call contract double @_QMautodiff_functionsPh_fortran(ptr nonnull %2)
  ret double %3
}

define double @f2_wrapper(double %0, double %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !15
  store double %1, ptr %3, align 8, !tbaa !15
  %5 = call contract double @_QMautodiff_functionsPf2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

define double @g2_wrapper(double %0, double %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !19
  store double %1, ptr %3, align 8, !tbaa !19
  %5 = call contract double @_QMautodiff_functionsPg2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

define double @h2_wrapper(double %0, double %1) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, ptr %4, align 8, !tbaa !23
  store double %1, ptr %3, align 8, !tbaa !23
  %5 = call contract double @_QMautodiff_functionsPh2_fortran(ptr nonnull %4, ptr nonnull %3)
  ret double %5
}

declare double @_QMautodiff_functionsPf_fortran(ptr nocapture) local_unnamed_addr

declare double @_QMautodiff_functionsPg_fortran(ptr nocapture) local_unnamed_addr

declare double @_QMautodiff_functionsPh_fortran(ptr nocapture) local_unnamed_addr

declare double @_QMautodiff_functionsPf2_fortran(ptr nocapture, ptr nocapture) local_unnamed_addr

declare double @_QMautodiff_functionsPg2_fortran(ptr nocapture, ptr nocapture) local_unnamed_addr

declare double @_QMautodiff_functionsPh2_fortran(ptr nocapture, ptr nocapture) local_unnamed_addr

attributes #0 = { "frame-pointer"="non-leaf" "target-cpu"="apple-m1" "target-features"="+zcm,+zcz,+v8.4a,+aes,+altnzcv,+ccdp,+ccpp,+complxnum,+crc,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{!"Homebrew flang version 20.1.8 (https://github.com/Homebrew/homebrew-core/issues)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang function root f_wrapper"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any data access", !9, i64 0}
!9 = !{!"any access", !10, i64 0}
!10 = !{!"Flang function root g_wrapper"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any data access", !13, i64 0}
!13 = !{!"any access", !14, i64 0}
!14 = !{!"Flang function root h_wrapper"}
!15 = !{!16, !16, i64 0}
!16 = !{!"any data access", !17, i64 0}
!17 = !{!"any access", !18, i64 0}
!18 = !{!"Flang function root f2_wrapper"}
!19 = !{!20, !20, i64 0}
!20 = !{!"any data access", !21, i64 0}
!21 = !{!"any access", !22, i64 0}
!22 = !{!"Flang function root g2_wrapper"}
!23 = !{!24, !24, i64 0}
!24 = !{!"any data access", !25, i64 0}
!25 = !{!"any access", !26, i64 0}
!26 = !{!"Flang function root h2_wrapper"}
