; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
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

; Function Attrs: nounwind ssp uwtable(sync)
define noundef i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.20)
  %3 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %4 = tail call double @f_wrapper(double noundef 2.000000e+00) #4
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef 2.000000e+00, double noundef %4)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, double noundef 2.000000e+00, double noundef %3, double noundef 6.000000e+00)
  %7 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %8 = tail call double @g_wrapper(double noundef 2.000000e+00) #4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, double noundef 2.000000e+00, double noundef %8)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef 2.000000e+00, double noundef %7, double noundef 0xBFE4EAA606DB24C1)
  %11 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h_wrapper, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %12 = tail call double @h_wrapper(double noundef 2.000000e+00) #4
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef 2.000000e+00, double noundef %12)
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, double noundef 2.000000e+00, double noundef %11, double noundef 0x401EE3BA0E2A3303)
  %15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.19)
  %16 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.20)
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.21)
  %18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.22)
  %19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.23)
  %20 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #4
  %21 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @f2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %22 = tail call double @f2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #4
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %22)
  %24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, double noundef %20, double noundef %21, double noundef 4.000000e+00, double noundef 5.000000e+00)
  %25 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #4
  %26 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @g2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %27 = tail call double @g2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #4
  %28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %27)
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, double noundef %25, double noundef %26, double noundef 0x402D1B45D35E56B4, double noundef 0x401A7EE1EBF12EE8)
  %30 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h2_wrapper, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef 0.000000e+00) #4
  %31 = tail call double (ptr, ...) @__enzyme_fwddiff(ptr noundef nonnull @h2_wrapper, double noundef 1.000000e+00, double noundef 0.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00) #4
  %32 = tail call double @h2_wrapper(double noundef 1.000000e+00, double noundef 2.000000e+00) #4
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, double noundef 1.000000e+00, double noundef 2.000000e+00, double noundef %32)
  %34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.17, double noundef %30, double noundef %31, double noundef 0xBFF5D4A14DC2DB26, double noundef 0xBFF2C1530624607C)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

declare double @__enzyme_fwddiff(ptr noundef, ...) local_unnamed_addr #2

declare double @f_wrapper(double noundef) #2

declare double @g_wrapper(double noundef) #2

declare double @h_wrapper(double noundef) #2

declare double @f2_wrapper(double noundef, double noundef) #2

declare double @g2_wrapper(double noundef, double noundef) #2

declare double @h2_wrapper(double noundef, double noundef) #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 19.1.7"}
