; ModuleID = 'test_functions.ll'
source_filename = "FIRModule"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

define float @f_(ptr nocapture %0) #0 {
  %2 = alloca float, i64 1, align 4
  %3 = load float, ptr %0, align 4
  %4 = fmul contract float %3, %3
  %5 = fmul contract float %3, 2.000000e+00
  %6 = fadd contract float %4, %5
  %7 = fadd contract float %6, 1.000000e+00
  store float %7, ptr %2, align 4
  %8 = load float, ptr %2, align 4
  ret float %8
}

define float @g_(ptr nocapture %0) #0 {
  %2 = alloca float, i64 1, align 4
  %3 = load float, ptr %0, align 4
  %4 = call contract float @llvm.sin.f32(float %3)
  %5 = call contract float @llvm.cos.f32(float %3)
  %6 = fmul contract float %4, %5
  store float %6, ptr %2, align 4
  %7 = load float, ptr %2, align 4
  ret float %7
}

define float @h_(ptr nocapture %0) #0 {
  %2 = alloca float, i64 1, align 4
  %3 = load float, ptr %0, align 4
  %4 = call contract float @llvm.exp.f32(float %3)
  %5 = fadd contract float %3, 1.000000e+00
  %6 = call contract float @llvm.log.f32(float %5)
  %7 = fadd contract float %4, %6
  store float %7, ptr %2, align 4
  %8 = load float, ptr %2, align 4
  ret float %8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sin.f32(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.cos.f32(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp.f32(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.log.f32(float) #1

attributes #0 = { "frame-pointer"="non-leaf" "target-cpu"="apple-m1" "target-features"="+zcm,+zcz,+v8.4a,+aes,+altnzcv,+ccdp,+ccpp,+complxnum,+crc,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{!"Homebrew flang version 20.1.8 (https://github.com/Homebrew/homebrew-core/issues)"}
