	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_comp_float             ## -- Begin function comp_float
	.p2align	4, 0x90
_comp_float:                            ## @comp_float
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovss	(%rdi), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	vsubss	(%rsi), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI1_0:
	.quad	4521832792735477133     ## double 1.9999999999999999E-6
LCPI1_1:
	.quad	4696837146684686336     ## double 1.0E+6
LCPI1_2:
	.quad	4613937818241073152     ## double 3
LCPI1_3:
	.quad	4602678819172646912     ## double 0.5
LCPI1_4:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpl	$1, %edi
	jle	LBB1_122
## %bb.1:
	movq	8(%r15), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB1_123
## %bb.2:
	movq	%rax, %r12
	movq	%rax, %rdi
	callq	_count_nnz
	movl	%eax, %ebx
	movq	%r12, %rdi
	callq	_rewind
	leaq	-276(%rbp), %rsi
	movq	%r12, %rdi
	callq	_mm_read_banner
	testl	%eax, %eax
	jne	LBB1_124
## %bb.3:
	leaq	-172(%rbp), %rsi
	leaq	-84(%rbp), %rdx
	leaq	-176(%rbp), %rcx
	movq	%r12, %rdi
	callq	_mm_read_mtx_crd_size
	testl	%eax, %eax
	jne	LBB1_123
## %bb.4:
	movl	-172(%rbp), %r14d
	movl	-84(%rbp), %eax
	cmpl	%eax, %r14d
	jle	LBB1_6
## %bb.5:
	movl	%r14d, -84(%rbp)
	jmp	LBB1_7
LBB1_6:
	movl	%eax, -172(%rbp)
	movl	%eax, %r14d
LBB1_7:
	movq	%rbx, -128(%rbp)        ## 8-byte Spill
	movslq	%ebx, %rbx
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB1_125
## %bb.8:
	movq	%rax, %r13
	movq	%r15, -192(%rbp)        ## 8-byte Spill
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_126
## %bb.9:
	movq	%rbx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB1_121
## %bb.10:
	movq	%rax, %r15
	leal	1(%r14), %eax
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_128
## %bb.11:
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_129
## %bb.12:
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_121
## %bb.13:
	movslq	%r14d, %rdi
	shlq	$2, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB1_130
## %bb.14:
	movl	%r14d, %edi
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	movq	%rax, %rsi
	callq	_init_arr
	movslq	-84(%rbp), %rdi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_131
## %bb.15:
	movb	-274(%rbp), %cl
	cmpb	$83, -273(%rbp)
	movl	-176(%rbp), %eax
	movq	%r13, -168(%rbp)        ## 8-byte Spill
	movq	%r12, -272(%rbp)        ## 8-byte Spill
	jne	LBB1_22
## %bb.16:
	cmpb	$80, %cl
	jne	LBB1_26
## %bb.17:
	testl	%eax, %eax
	jle	LBB1_48
## %bb.18:
	leaq	L_.str.14(%rip), %r14
	leaq	-108(%rbp), %r12
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB1_19:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	movq	%r14, %rsi
	leaq	-112(%rbp), %rdx
	movq	%r12, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-112(%rbp), %esi
	leal	-1(%rsi), %r8d
	movslq	%r13d, %rax
	movq	-168(%rbp), %r9         ## 8-byte Reload
	movl	%r8d, (%r9,%rax,4)
	movl	-108(%rbp), %edi
	leal	-1(%rdi), %edx
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movl	%edx, (%rcx,%rax,4)
	movl	$1065353216, (%r15,%rax,4) ## imm = 0x3F800000
	addl	$1, %eax
	cmpl	%edi, %esi
	je	LBB1_21
## %bb.20:                              ##   in Loop: Header=BB1_19 Depth=1
	cltq
	movl	%edx, (%r9,%rax,4)
	movl	%r8d, (%rcx,%rax,4)
	movl	$1065353216, (%r15,%rax,4) ## imm = 0x3F800000
	addl	$2, %r13d
	movl	%r13d, %eax
LBB1_21:                                ##   in Loop: Header=BB1_19 Depth=1
	addl	$1, %ebx
	movl	%eax, %r13d
	cmpl	-176(%rbp), %ebx
	jl	LBB1_19
	jmp	LBB1_48
LBB1_22:
	cmpb	$80, %cl
	jne	LBB1_39
## %bb.23:
	testl	%eax, %eax
	jle	LBB1_48
## %bb.24:
	leaq	L_.str.14(%rip), %r14
	leaq	-112(%rbp), %r13
	leaq	-108(%rbp), %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB1_25:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-112(%rbp), %eax
	addl	$-1, %eax
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-108(%rbp), %eax
	addl	$-1, %eax
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	$1065353216, (%r15,%rbx,4) ## imm = 0x3F800000
	addq	$1, %rbx
	movslq	-176(%rbp), %rax
	cmpq	%rax, %rbx
	jl	LBB1_25
	jmp	LBB1_48
LBB1_26:
	testl	%eax, %eax
	jle	LBB1_48
## %bb.27:
	leaq	L_.str.10(%rip), %r14
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB1_28:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	movq	%r14, %rsi
	leaq	-112(%rbp), %rdx
	leaq	-108(%rbp), %rcx
	leaq	-288(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	vmovsd	-288(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	je	LBB1_35
## %bb.29:                              ##   in Loop: Header=BB1_28 Depth=1
	movl	-112(%rbp), %eax
	addl	$-1, %eax
	movslq	%ebx, %r13
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%r13,4)
	movl	-108(%rbp), %eax
	addl	$-1, %eax
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%r13,4)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%r13,4)
	callq	___fpclassifyf
	cmpl	$1, %eax
	je	LBB1_119
## %bb.30:                              ##   in Loop: Header=BB1_28 Depth=1
	vmovss	(%r15,%r13,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$2, %eax
	je	LBB1_120
## %bb.31:                              ##   in Loop: Header=BB1_28 Depth=1
	vmovss	(%r15,%r13,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_33
## %bb.32:                              ##   in Loop: Header=BB1_28 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movl	$0, (%r15,%r13,4)
LBB1_33:                                ##   in Loop: Header=BB1_28 Depth=1
	movl	-112(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jne	LBB1_36
## %bb.34:                              ##   in Loop: Header=BB1_28 Depth=1
	addl	$1, %ebx
LBB1_35:                                ##   in Loop: Header=BB1_28 Depth=1
	addl	$1, %r12d
	cmpl	-176(%rbp), %r12d
	jl	LBB1_28
	jmp	LBB1_48
	.p2align	4, 0x90
LBB1_36:                                ##   in Loop: Header=BB1_28 Depth=1
	movq	-160(%rbp), %rdx        ## 8-byte Reload
	movl	(%rdx,%r13,4), %eax
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, 4(%rcx,%r13,4)
	movl	(%rcx,%r13,4), %eax
	movl	%eax, 4(%rdx,%r13,4)
	vmovsd	-288(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 4(%r15,%r13,4)
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_38
## %bb.37:                              ##   in Loop: Header=BB1_28 Depth=1
	addq	$1, %r13
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movl	$0, (%r15,%r13,4)
LBB1_38:                                ##   in Loop: Header=BB1_28 Depth=1
	addl	$2, %ebx
	addl	$1, %r12d
	cmpl	-176(%rbp), %r12d
	jl	LBB1_28
	jmp	LBB1_48
LBB1_39:
	testl	%eax, %eax
	jle	LBB1_48
## %bb.40:
	leaq	L_.str.10(%rip), %r14
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB1_41:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	movq	%r14, %rsi
	leaq	-112(%rbp), %rdx
	leaq	-108(%rbp), %rcx
	leaq	-288(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	vmovsd	-288(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	je	LBB1_47
## %bb.42:                              ##   in Loop: Header=BB1_41 Depth=1
	movl	-112(%rbp), %eax
	addl	$-1, %eax
	movslq	%r13d, %rbx
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-108(%rbp), %eax
	addl	$-1, %eax
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%rbx,4)
	callq	___fpclassifyf
	cmpl	$1, %eax
	je	LBB1_119
## %bb.43:                              ##   in Loop: Header=BB1_41 Depth=1
	vmovss	(%r15,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$2, %eax
	je	LBB1_120
## %bb.44:                              ##   in Loop: Header=BB1_41 Depth=1
	vmovss	(%r15,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_46
## %bb.45:                              ##   in Loop: Header=BB1_41 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movl	$0, (%r15,%rbx,4)
LBB1_46:                                ##   in Loop: Header=BB1_41 Depth=1
	addl	$1, %r13d
LBB1_47:                                ##   in Loop: Header=BB1_41 Depth=1
	addl	$1, %r12d
	cmpl	-176(%rbp), %r12d
	jl	LBB1_41
LBB1_48:
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	leal	-1(%rbx), %r8d
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	movq	-160(%rbp), %rsi        ## 8-byte Reload
	movq	%r15, %rdx
	xorl	%ecx, %ecx
	callq	_quickSort
	movl	$1, %r14d
	cmpl	$1000000, %ebx          ## imm = 0xF4240
	jg	LBB1_54
## %bb.49:
	movl	$500, %r14d             ## imm = 0x1F4
	cmpl	$100000, %ebx           ## imm = 0x186A0
	jg	LBB1_54
## %bb.50:
	movl	$1000, %r14d            ## imm = 0x3E8
	cmpl	$50000, %ebx            ## imm = 0xC350
	jg	LBB1_54
## %bb.51:
	movl	$5000, %r14d            ## imm = 0x1388
	cmpl	$20000, %ebx            ## imm = 0x4E20
	jg	LBB1_54
## %bb.52:
	movl	$10000, %r14d           ## imm = 0x2710
	cmpl	$5000, %ebx             ## imm = 0x1388
	jg	LBB1_54
## %bb.53:
	cmpl	$500, %ebx              ## imm = 0x1F4
	movl	$100000, %eax           ## imm = 0x186A0
	movl	$1000000, %r14d         ## imm = 0xF4240
	cmovgl	%eax, %r14d
LBB1_54:
	movq	-192(%rbp), %rbx        ## 8-byte Reload
	leaq	8(%rbx), %rax
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	movq	8(%rbx), %rdi
	callq	_basename
	leaq	16(%rbx), %rcx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	16(%rbx), %rcx
	leaq	L_.str.15(%rip), %rdi
	leaq	_main.phase(%rip), %r12
	movq	%r12, %rsi
	movq	%rax, %rdx
	movl	$3, %r8d
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_basename
	movq	16(%rbx), %rcx
	leaq	L_.str.16(%rip), %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	movl	%r14d, %r8d
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_basename
	movq	16(%rbx), %rcx
	movl	-84(%rbp), %r8d
	leaq	L_.str.17(%rip), %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_basename
	movq	16(%rbx), %rcx
	leaq	L_.str.18(%rip), %rdi
	movq	%r12, %rsi
	movq	-128(%rbp), %r13        ## 8-byte Reload
	movq	%rax, %rdx
	movl	%r13d, %r8d
	xorl	%eax, %eax
	callq	_printf
	movq	16(%rbx), %rdi
	leaq	L_.str.19(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	movq	%r15, -264(%rbp)        ## 8-byte Spill
	movq	-136(%rbp), %r12        ## 8-byte Reload
	movl	%r14d, -192(%rbp)       ## 4-byte Spill
	je	LBB1_71
## %bb.55:
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	movq	(%rbx), %rdi
	leaq	L_.str.25(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	je	LBB1_84
## %bb.56:
	movq	(%rbx), %rdi
	leaq	L_.str.27(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	je	LBB1_96
## %bb.57:
	movq	(%rbx), %rdi
	leaq	L_.str.28(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	movq	-208(%rbp), %r12        ## 8-byte Reload
	movq	-248(%rbp), %r13        ## 8-byte Reload
	jne	LBB1_114
## %bb.58:
	movl	-84(%rbp), %esi
	movq	-240(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, 8(%rsp)
	movq	%r13, (%rsp)
	movq	-128(%rbp), %r14        ## 8-byte Reload
	movl	%r14d, %edi
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movq	%r15, %r8
	movq	%r12, %r9
	callq	_coo_csr
	movl	-84(%rbp), %r9d
	movl	%r14d, 8(%rsp)
	leaq	-140(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-224(%rbp), %rcx
	leaq	-216(%rbp), %r8
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	_csr_ell
	vcvtsi2sdl	%r14d, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-192(%rbp), %r14d       ## 4-byte Reload
	vcvtsi2sdl	%r14d, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)       ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	-136(%rbp), %r12        ## 8-byte Reload
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movl	%r14d, %ebx
	movq	-152(%rbp), %r15        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_59:                                ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movq	%r15, %r8
	movq	%r12, %r9
	callq	_spmv_ell
	addl	$-1, %ebx
	jne	LBB1_59
## %bb.60:
	callq	_clock
	subq	-96(%rbp), %rax         ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm2, %xmm2
	je	LBB1_62
## %bb.61:
	vdivsd	LCPI1_1(%rip), %xmm2, %xmm0
	vmovsd	-128(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -80(%rbp)
LBB1_62:
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movl	%r14d, %ebx
	movq	-152(%rbp), %r15        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_63:                                ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movq	%r15, %r8
	movq	%r12, %r9
	callq	_spmv_ell
	addl	$-1, %ebx
	jne	LBB1_63
## %bb.64:
	callq	_clock
	subq	-104(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_66
## %bb.65:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -72(%rbp)
LBB1_66:
	vaddsd	-96(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r15
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_67:                                ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movq	%rbx, %r8
	movq	%r12, %r9
	callq	_spmv_ell
	addl	$-1, %r14d
	jne	LBB1_67
## %bb.68:
	callq	_clock
	subq	%r15, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_70
## %bb.69:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -64(%rbp)
LBB1_70:
	vaddsd	-96(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	LCPI1_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	vmulsd	-128(%rbp), %xmm1, %xmm1 ## 8-byte Folded Reload
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -192(%rbp)       ## 8-byte Spill
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	leaq	_comp_float(%rip), %rcx
	leaq	-80(%rbp), %rdi
	movl	$3, %esi
	movl	$8, %edx
	callq	_qsort
	vmovsd	-80(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vmovupd	-72(%rbp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm2
	vmulsd	LCPI1_3(%rip), %xmm2, %xmm2
	vmovapd	-128(%rbp), %xmm4       ## 16-byte Reload
	vsubsd	%xmm0, %xmm4, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovddup	%xmm4, %xmm3    ## xmm3 = xmm4[0,0]
	vsubpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm1, %xmm1 ## xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm2, %xmm2, %xmm1
	vmovss	%xmm1, -96(%rbp)        ## 4-byte Spill
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)       ## 8-byte Spill
	movq	-200(%rbp), %rbx        ## 8-byte Reload
	movq	(%rbx), %rdi
	callq	_basename
	movq	-232(%rbp), %r14        ## 8-byte Reload
	movq	(%r14), %rcx
	leaq	L_.str.26(%rip), %rdi
	leaq	_main.phase(%rip), %r15
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-104(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	leaq	L_.str.21(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovaps	-128(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	vmovss	-96(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.22(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	leaq	L_.str.23(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-192(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	%rax, %rbx
	movq	(%r14), %r12
	movl	-172(%rbp), %esi
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	jmp	LBB1_109
LBB1_71:
	vcvtsi2sdl	%r13d, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	vcvtsi2sdl	%r14d, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movl	%r14d, %ebx
	movq	%r15, %r14
	movq	-160(%rbp), %r15        ## 8-byte Reload
	movq	-152(%rbp), %r13        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_72:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %r8d
	movq	%r12, (%rsp)
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	movq	%r14, %rdx
	movq	-128(%rbp), %rcx        ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movq	%r13, %r9
	callq	_spmv_coo
	addl	$-1, %ebx
	jne	LBB1_72
## %bb.73:
	callq	_clock
	subq	-104(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm2, %xmm2
	je	LBB1_75
## %bb.74:
	vdivsd	LCPI1_1(%rip), %xmm2, %xmm0
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -80(%rbp)
LBB1_75:
	vmovsd	%xmm2, -104(%rbp)       ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	callq	_zero_arr
	callq	_clock
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	movl	-192(%rbp), %ebx        ## 4-byte Reload
	movq	-160(%rbp), %r15        ## 8-byte Reload
	movq	-264(%rbp), %r14        ## 8-byte Reload
	movq	-152(%rbp), %r12        ## 8-byte Reload
	movq	-128(%rbp), %r13        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_76:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %r8d
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	%rax, (%rsp)
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	movq	%r14, %rdx
	movl	%r13d, %ecx
	movq	%r12, %r9
	callq	_spmv_coo
	addl	$-1, %ebx
	jne	LBB1_76
## %bb.77:
	callq	_clock
	subq	-296(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_79
## %bb.78:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -72(%rbp)
LBB1_79:
	vaddsd	-104(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, -104(%rbp)       ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	callq	_zero_arr
	callq	_clock
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	movq	-168(%rbp), %r15        ## 8-byte Reload
	movq	-264(%rbp), %r12        ## 8-byte Reload
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	movq	-128(%rbp), %r13        ## 8-byte Reload
	movl	-192(%rbp), %r14d       ## 4-byte Reload
	.p2align	4, 0x90
LBB1_80:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %r8d
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	%rax, (%rsp)
	movq	%r15, %rdi
	movq	-160(%rbp), %rsi        ## 8-byte Reload
	movq	%r12, %rdx
	movl	%r13d, %ecx
	movq	%rbx, %r9
	callq	_spmv_coo
	addl	$-1, %r14d
	jne	LBB1_80
## %bb.81:
	callq	_clock
	subq	-296(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_83
## %bb.82:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -64(%rbp)
LBB1_83:
	vaddsd	-104(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	LCPI1_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	vmulsd	-96(%rbp), %xmm1, %xmm1 ## 8-byte Folded Reload
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -192(%rbp)       ## 8-byte Spill
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	leaq	_comp_float(%rip), %rcx
	leaq	-80(%rbp), %rdi
	movl	$3, %esi
	movl	$8, %edx
	callq	_qsort
	vmovsd	-80(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vmovupd	-72(%rbp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm2
	vmulsd	LCPI1_3(%rip), %xmm2, %xmm2
	vmovapd	-128(%rbp), %xmm4       ## 16-byte Reload
	vsubsd	%xmm0, %xmm4, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovddup	%xmm4, %xmm3    ## xmm3 = xmm4[0,0]
	vsubpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm1, %xmm1 ## xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm2, %xmm2, %xmm1
	vmovss	%xmm1, -96(%rbp)        ## 4-byte Spill
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)       ## 8-byte Spill
	movq	-200(%rbp), %r14        ## 8-byte Reload
	movq	(%r14), %rdi
	callq	_basename
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	movq	(%rbx), %rcx
	leaq	L_.str.20(%rip), %rdi
	leaq	_main.phase(%rip), %r15
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-104(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	leaq	L_.str.21(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovaps	-128(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	vmovss	-96(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.22(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	leaq	L_.str.23(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-192(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	%rax, %r14
	movq	(%rbx), %r12
	movl	-172(%rbp), %esi
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	movq	%r12, %rcx
	movl	%eax, %r8d
	xorl	%eax, %eax
	callq	_printf
	movq	-264(%rbp), %r15        ## 8-byte Reload
	movq	-248(%rbp), %r13        ## 8-byte Reload
	jmp	LBB1_113
LBB1_84:
	movl	-84(%rbp), %esi
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	-248(%rbp), %r13        ## 8-byte Reload
	movq	%r13, (%rsp)
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	movl	%ebx, %edi
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movq	%r15, %r8
	movq	-208(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	callq	_coo_csr
	vcvtsi2sdl	%ebx, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-192(%rbp), %ebx        ## 4-byte Reload
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)       ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movq	%r12, %r14
	movq	-152(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_85:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %ecx
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	-240(%rbp), %rdx        ## 8-byte Reload
	movq	%r12, %r8
	movq	%r14, %r9
	callq	_spmv_csr
	addl	$-1, %ebx
	jne	LBB1_85
## %bb.86:
	callq	_clock
	subq	-96(%rbp), %rax         ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm2, %xmm2
	je	LBB1_88
## %bb.87:
	vdivsd	LCPI1_1(%rip), %xmm2, %xmm0
	vmovsd	-128(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -80(%rbp)
LBB1_88:
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	callq	_zero_arr
	callq	_clock
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movl	-192(%rbp), %ebx        ## 4-byte Reload
	movq	-240(%rbp), %r13        ## 8-byte Reload
	movq	-208(%rbp), %r15        ## 8-byte Reload
	movq	-152(%rbp), %r12        ## 8-byte Reload
	movq	-248(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_89:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r12, %r8
	movq	-136(%rbp), %r9         ## 8-byte Reload
	callq	_spmv_csr
	addl	$-1, %ebx
	jne	LBB1_89
## %bb.90:
	callq	_clock
	subq	-104(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_92
## %bb.91:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -72(%rbp)
LBB1_92:
	vaddsd	-96(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	callq	_zero_arr
	callq	_clock
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movq	-240(%rbp), %r12        ## 8-byte Reload
	movq	-208(%rbp), %r15        ## 8-byte Reload
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	movq	-248(%rbp), %r14        ## 8-byte Reload
	movl	-192(%rbp), %r13d       ## 4-byte Reload
	.p2align	4, 0x90
LBB1_93:                                ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r12, %rdx
	movq	%rbx, %r8
	movq	-136(%rbp), %r9         ## 8-byte Reload
	callq	_spmv_csr
	addl	$-1, %r13d
	jne	LBB1_93
## %bb.94:
	movq	%r14, %r13
	callq	_clock
	subq	-104(%rbp), %rax        ## 8-byte Folded Reload
	jne	LBB1_110
## %bb.95:
	vmovsd	-64(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vcvtusi2sdq	%rax, %xmm3, %xmm1
	movq	-232(%rbp), %r14        ## 8-byte Reload
	movq	-200(%rbp), %rbx        ## 8-byte Reload
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	jmp	LBB1_111
LBB1_96:
	movl	-84(%rbp), %esi
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	-248(%rbp), %r13        ## 8-byte Reload
	movq	%r13, (%rsp)
	movq	-128(%rbp), %r14        ## 8-byte Reload
	movl	%r14d, %edi
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movq	%r15, %r8
	movq	-208(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %r9
	callq	_coo_csr
	movl	-84(%rbp), %r9d
	movl	%r14d, 16(%rsp)
	leaq	-252(%rbp), %rax
	movq	%rax, 8(%rsp)
	leaq	-140(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-224(%rbp), %rcx
	leaq	-216(%rbp), %r8
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	-240(%rbp), %rdx        ## 8-byte Reload
	callq	_csr_dia
	vcvtsi2sdl	%r14d, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-192(%rbp), %ebx        ## 4-byte Reload
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)       ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r14
	movq	-152(%rbp), %r15        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_97:                                ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movl	-252(%rbp), %r8d
	movq	%r12, (%rsp)
	movq	%r15, %r9
	callq	_spmv_dia
	addl	$-1, %ebx
	jne	LBB1_97
## %bb.98:
	callq	_clock
	subq	%r14, %rax
	vcvtusi2sdq	%rax, %xmm2, %xmm2
	je	LBB1_100
## %bb.99:
	vdivsd	LCPI1_1(%rip), %xmm2, %xmm0
	vmovsd	-128(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -80(%rbp)
LBB1_100:
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r14
	movl	-192(%rbp), %ebx        ## 4-byte Reload
	movq	-152(%rbp), %r15        ## 8-byte Reload
	movq	-248(%rbp), %r13        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_101:                               ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movl	-252(%rbp), %r8d
	movq	%r12, (%rsp)
	movq	%r15, %r9
	callq	_spmv_dia
	addl	$-1, %ebx
	jne	LBB1_101
## %bb.102:
	callq	_clock
	subq	%r14, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_104
## %bb.103:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -72(%rbp)
LBB1_104:
	vaddsd	-96(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-84(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r15
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	movl	-192(%rbp), %r14d       ## 4-byte Reload
	.p2align	4, 0x90
LBB1_105:                               ## =>This Inner Loop Header: Depth=1
	movq	-224(%rbp), %rdi
	movq	-216(%rbp), %rsi
	movl	-84(%rbp), %edx
	movl	-140(%rbp), %ecx
	movl	-252(%rbp), %r8d
	movq	%r12, (%rsp)
	movq	%rbx, %r9
	callq	_spmv_dia
	addl	$-1, %r14d
	jne	LBB1_105
## %bb.106:
	callq	_clock
	subq	%r15, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_108
## %bb.107:
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -64(%rbp)
LBB1_108:
	vaddsd	-96(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	LCPI1_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	vmulsd	-128(%rbp), %xmm1, %xmm1 ## 8-byte Folded Reload
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -192(%rbp)       ## 8-byte Spill
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	leaq	_comp_float(%rip), %rcx
	leaq	-80(%rbp), %rdi
	movl	$3, %esi
	movl	$8, %edx
	callq	_qsort
	vmovsd	-80(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vmovupd	-72(%rbp), %xmm1
	vaddsd	%xmm0, %xmm1, %xmm2
	vmulsd	LCPI1_3(%rip), %xmm2, %xmm2
	vmovapd	-128(%rbp), %xmm4       ## 16-byte Reload
	vsubsd	%xmm0, %xmm4, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovddup	%xmm4, %xmm3    ## xmm3 = xmm4[0,0]
	vsubpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm1, %xmm1 ## xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm2, %xmm2, %xmm1
	vmovss	%xmm1, -96(%rbp)        ## 4-byte Spill
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)       ## 8-byte Spill
	movq	-200(%rbp), %r14        ## 8-byte Reload
	movq	(%r14), %rdi
	callq	_basename
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	movq	(%rbx), %rcx
	leaq	L_.str.26(%rip), %rdi
	leaq	_main.phase(%rip), %r15
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-104(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	leaq	L_.str.21(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovaps	-128(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	vmovss	-96(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.22(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	(%rbx), %rcx
	leaq	L_.str.23(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-192(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%r14), %rdi
	callq	_basename
	movq	%rax, %r14
	movq	(%rbx), %r12
	movl	-172(%rbp), %esi
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
LBB1_109:
	movq	%r12, %rcx
	movl	%eax, %r8d
	xorl	%eax, %eax
	callq	_printf
	movq	-216(%rbp), %rdi
	callq	_free
	movq	-224(%rbp), %rdi
	callq	_free
	jmp	LBB1_112
LBB1_110:
	vcvtusi2sdq	%rax, %xmm3, %xmm1
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm0
	vmovsd	-128(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movq	-232(%rbp), %r14        ## 8-byte Reload
	movq	-200(%rbp), %rbx        ## 8-byte Reload
LBB1_111:
	vmovsd	-96(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vaddsd	%xmm1, %xmm3, %xmm1
	vmulsd	LCPI1_2(%rip), %xmm2, %xmm2
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, -128(%rbp)       ## 8-byte Spill
	vdivsd	%xmm1, %xmm2, %xmm3
	vmovapd	%xmm3, -192(%rbp)       ## 16-byte Spill
	vmovddup	%xmm3, %xmm1    ## xmm1 = xmm3[0,0]
	vsubpd	-80(%rbp), %xmm1, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm2
	vpermilpd	$1, %xmm1, %xmm1 ## xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm0, %xmm3, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -200(%rbp)       ## 8-byte Spill
	leaq	_comp_float(%rip), %rcx
	leaq	-80(%rbp), %rdi
	movl	$3, %esi
	movl	$8, %edx
	callq	_qsort
	vmovsd	-72(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vaddsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	LCPI1_3(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -232(%rbp)       ## 4-byte Spill
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -200(%rbp)       ## 8-byte Spill
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	leaq	L_.str.26(%rip), %rdi
	leaq	_main.phase(%rip), %r15
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	leaq	L_.str.21(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovaps	-192(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	vmovss	-232(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.22(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	(%r14), %rcx
	leaq	L_.str.23(%rip), %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	vmovsd	-128(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movq	(%rbx), %rdi
	callq	_basename
	movq	%rax, %rbx
	movq	(%r14), %r12
	movl	-172(%rbp), %esi
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movl	%eax, %r8d
	xorl	%eax, %eax
	callq	_printf
LBB1_112:
	movq	-264(%rbp), %r15        ## 8-byte Reload
LBB1_113:
	movq	-208(%rbp), %r12        ## 8-byte Reload
LBB1_114:
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	je	LBB1_116
## %bb.115:
	callq	_fclose
LBB1_116:
	movq	-152(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	%r12, %rdi
	callq	_free
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-160(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	%r15, %rdi
	callq	_free
	movq	%r13, %rdi
	callq	_free
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB1_118
## %bb.117:
	xorl	%eax, %eax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_118:
	callq	___stack_chk_fail
LBB1_119:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.11(%rip), %rdi
	movl	$16, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_120:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.12(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_121:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.5(%rip), %rdi
	jmp	LBB1_127
LBB1_122:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	(%r15), %rdx
	leaq	L_.str(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB1_123:
	movl	$1, %edi
	callq	_exit
LBB1_124:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$40, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_125:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	jmp	LBB1_127
LBB1_126:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.4(%rip), %rdi
LBB1_127:
	movl	$34, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_128:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.6(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_129:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.7(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_130:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.8(%rip), %rdi
	movl	$32, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_131:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.9(%rip), %rdi
	movl	$32, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Usage: %s [martix-market-filename]\n"

L_.str.1:                               ## @.str.1
	.asciz	"r"

L_.str.2:                               ## @.str.2
	.asciz	"Could not process Matrix Market banner.\n"

L_.str.3:                               ## @.str.3
	.asciz	"couldn't allocate row using malloc"

L_.str.4:                               ## @.str.4
	.asciz	"couldn't allocate col using malloc"

L_.str.5:                               ## @.str.5
	.asciz	"couldn't allocate val using malloc"

L_.str.6:                               ## @.str.6
	.asciz	"couldn't allocate row_ptr using malloc"

L_.str.7:                               ## @.str.7
	.asciz	"couldn't allocate colind using malloc"

L_.str.8:                               ## @.str.8
	.asciz	"couldn't allocate x using malloc"

L_.str.9:                               ## @.str.9
	.asciz	"couldn't allocate y using calloc"

L_.str.10:                              ## @.str.10
	.asciz	"%d %d %lf\n"

L_.str.11:                              ## @.str.11
	.asciz	"bad value : nan\n"

L_.str.12:                              ## @.str.12
	.asciz	"bad value : infinite\n"

L_.str.13:                              ## @.str.13
	.asciz	"bad value : subnormal\n"

L_.str.14:                              ## @.str.14
	.asciz	"%d %d\n"

	.section	__TEXT,__const
_main.phase:                            ## @main.phase
	.asciz	"Sparse"

	.section	__TEXT,__cstring,cstring_literals
L_.str.15:                              ## @.str.15
	.asciz	"\n%s\t%s\t%s\tOuter\t%d\n"

L_.str.16:                              ## @.str.16
	.asciz	"%s\t%s\t%s\tInner\t%d\n"

L_.str.17:                              ## @.str.17
	.asciz	"%s\t%s\t%s\tN\t%d\n"

L_.str.18:                              ## @.str.18
	.asciz	"%s\t%s\t%s\tNNZ\t%d\n"

L_.str.19:                              ## @.str.19
	.asciz	"coo"

L_.str.20:                              ## @.str.20
	.asciz	"%s\t%s\t%s\tSD\t%g\n"

L_.str.21:                              ## @.str.21
	.asciz	"%s\t%s\t%s\tMFLOPS_s\t%g\n"

L_.str.22:                              ## @.str.22
	.asciz	"%s\t%s\t%s\tMFLOPS_median\t%g\n"

L_.str.23:                              ## @.str.23
	.asciz	"%s\t%s\t%s\tTime\t%g\n"

L_.str.24:                              ## @.str.24
	.asciz	"%s\t%s\t%s\tFletcher_sum\t%d\n"

L_.str.25:                              ## @.str.25
	.asciz	"csr"

L_.str.26:                              ## @.str.26
	.asciz	"%s\t%s\t%s\tSD\t%f\n"

L_.str.27:                              ## @.str.27
	.asciz	"dia"

L_.str.28:                              ## @.str.28
	.asciz	"ell"


.subsections_via_symbols
