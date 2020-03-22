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
	.quad	4626322717216342016     ## double 20
LCPI1_3:
	.quad	4602678819172646912     ## double 0.5
LCPI1_4:
	.quad	4607182418800017408     ## double 1
LCPI1_5:
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
	subq	$392, %rsp              ## imm = 0x188
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpl	$1, %edi
	jle	LBB1_104
## %bb.1:
	movq	8(%r14), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB1_105
## %bb.2:
	movq	%rax, %r12
	movq	%rax, %rdi
	callq	_count_nnz
	movl	%eax, %ebx
	movq	%r12, %rdi
	callq	_rewind
	leaq	-404(%rbp), %rsi
	movq	%r12, %rdi
	callq	_mm_read_banner
	testl	%eax, %eax
	jne	LBB1_3
## %bb.4:
	leaq	-244(%rbp), %rsi
	leaq	-212(%rbp), %rdx
	leaq	-284(%rbp), %rcx
	movq	%r12, %rdi
	callq	_mm_read_mtx_crd_size
	testl	%eax, %eax
	jne	LBB1_105
## %bb.5:
	movl	-244(%rbp), %r13d
	movl	-212(%rbp), %eax
	cmpl	%eax, %r13d
	movq	%r14, -272(%rbp)        ## 8-byte Spill
	jle	LBB1_7
## %bb.6:
	movl	%r13d, -212(%rbp)
	jmp	LBB1_8
LBB1_7:
	movl	%eax, -244(%rbp)
	movl	%eax, %r13d
LBB1_8:
	movq	%rbx, -296(%rbp)        ## 8-byte Spill
	movslq	%ebx, %r14
	shlq	$2, %r14
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -280(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_9
## %bb.12:
	movq	%r14, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB1_13
## %bb.14:
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_15
## %bb.16:
	leal	1(%r13), %eax
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, -384(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_17
## %bb.18:
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -352(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_19
## %bb.20:
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_15
## %bb.21:
	movslq	%r13d, %rdi
	shlq	$2, %rdi
	callq	_malloc
	testq	%rax, %rax
	movq	-240(%rbp), %r14        ## 8-byte Reload
	je	LBB1_22
## %bb.24:
	movq	%rax, %rbx
	movl	%r13d, %edi
	movq	%rax, %rsi
	callq	_init_arr
	movslq	-212(%rbp), %rdi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB1_25
## %bb.26:
	movq	%rbx, %r13
	movb	-402(%rbp), %cl
	cmpb	$83, -401(%rbp)
	movl	-284(%rbp), %eax
	movq	%r12, -368(%rbp)        ## 8-byte Spill
	jne	LBB1_49
## %bb.27:
	cmpb	$80, %cl
	jne	LBB1_28
## %bb.33:
	testl	%eax, %eax
	jle	LBB1_62
## %bb.34:
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB1_35:                                ## =>This Inner Loop Header: Depth=1
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.14(%rip), %rsi
	leaq	-232(%rbp), %rdx
	leaq	-228(%rbp), %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-232(%rbp), %esi
	leal	-1(%rsi), %r8d
	movslq	%r12d, %rax
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	movl	%r8d, (%rcx,%rax,4)
	movl	-228(%rbp), %edi
	leal	-1(%rdi), %edx
	movl	%edx, (%r15,%rax,4)
	movl	$1065353216, (%r14,%rax,4) ## imm = 0x3F800000
	addl	$1, %eax
	cmpl	%edi, %esi
	je	LBB1_37
## %bb.36:                              ##   in Loop: Header=BB1_35 Depth=1
	cltq
	movl	%edx, (%rcx,%rax,4)
	movl	%r8d, (%r15,%rax,4)
	movl	$1065353216, (%r14,%rax,4) ## imm = 0x3F800000
	addl	$2, %r12d
	movl	%r12d, %eax
LBB1_37:                                ##   in Loop: Header=BB1_35 Depth=1
	addl	$1, %ebx
	movl	%eax, %r12d
	cmpl	-284(%rbp), %ebx
	jl	LBB1_35
	jmp	LBB1_62
LBB1_49:
	cmpb	$80, %cl
	jne	LBB1_50
## %bb.59:
	testl	%eax, %eax
	jle	LBB1_62
## %bb.60:
	leaq	L_.str.14(%rip), %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB1_61:                                ## =>This Inner Loop Header: Depth=1
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	movq	%r12, %rsi
	leaq	-232(%rbp), %rdx
	leaq	-228(%rbp), %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-232(%rbp), %eax
	addl	$-1, %eax
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-228(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, (%r15,%rbx,4)
	movl	$1065353216, (%r14,%rbx,4) ## imm = 0x3F800000
	addq	$1, %rbx
	movslq	-284(%rbp), %rax
	cmpq	%rax, %rbx
	jl	LBB1_61
	jmp	LBB1_62
LBB1_28:
	testl	%eax, %eax
	jle	LBB1_62
## %bb.29:
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB1_30:                                ## =>This Inner Loop Header: Depth=1
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.10(%rip), %rsi
	leaq	-232(%rbp), %rdx
	leaq	-228(%rbp), %rcx
	leaq	-416(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	vmovsd	-416(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	je	LBB1_48
## %bb.31:                              ##   in Loop: Header=BB1_30 Depth=1
	movl	-232(%rbp), %eax
	addl	$-1, %eax
	movl	%ebx, -224(%rbp)        ## 4-byte Spill
	movslq	%ebx, %rbx
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-228(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, (%r15,%rbx,4)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rbx,4)
	callq	___fpclassifyf
	cmpl	$1, %eax
	je	LBB1_32
## %bb.38:                              ##   in Loop: Header=BB1_30 Depth=1
	vmovss	(%r14,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$2, %eax
	je	LBB1_39
## %bb.40:                              ##   in Loop: Header=BB1_30 Depth=1
	vmovss	(%r14,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_42
## %bb.41:                              ##   in Loop: Header=BB1_30 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movl	$0, (%rax,%rbx,4)
LBB1_42:                                ##   in Loop: Header=BB1_30 Depth=1
	movl	-232(%rbp), %eax
	cmpl	-228(%rbp), %eax
	jne	LBB1_44
## %bb.43:                              ##   in Loop: Header=BB1_30 Depth=1
	movl	-224(%rbp), %ebx        ## 4-byte Reload
	addl	$1, %ebx
	jmp	LBB1_47
	.p2align	4, 0x90
LBB1_44:                                ##   in Loop: Header=BB1_30 Depth=1
	movl	(%r15,%rbx,4), %eax
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, 4(%rcx,%rbx,4)
	movl	(%rcx,%rbx,4), %eax
	movl	%eax, 4(%r15,%rbx,4)
	vmovsd	-416(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movq	-240(%rbp), %rax        ## 8-byte Reload
	vmovss	%xmm0, 4(%rax,%rbx,4)
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_46
## %bb.45:                              ##   in Loop: Header=BB1_30 Depth=1
	addq	$1, %rbx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movl	$0, (%rax,%rbx,4)
LBB1_46:                                ##   in Loop: Header=BB1_30 Depth=1
	movl	-224(%rbp), %ebx        ## 4-byte Reload
	addl	$2, %ebx
LBB1_47:                                ##   in Loop: Header=BB1_30 Depth=1
	movq	-240(%rbp), %r14        ## 8-byte Reload
LBB1_48:                                ##   in Loop: Header=BB1_30 Depth=1
	addl	$1, %r12d
	cmpl	-284(%rbp), %r12d
	jl	LBB1_30
	jmp	LBB1_62
LBB1_50:
	testl	%eax, %eax
	jle	LBB1_62
## %bb.51:
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB1_52:                                ## =>This Inner Loop Header: Depth=1
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.10(%rip), %rsi
	leaq	-232(%rbp), %rdx
	leaq	-228(%rbp), %rcx
	leaq	-416(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	vmovsd	-416(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	je	LBB1_58
## %bb.53:                              ##   in Loop: Header=BB1_52 Depth=1
	movl	-232(%rbp), %eax
	addl	$-1, %eax
	movl	%ebx, -224(%rbp)        ## 4-byte Spill
	movslq	%ebx, %rbx
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-228(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, (%r15,%rbx,4)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rbx,4)
	callq	___fpclassifyf
	cmpl	$1, %eax
	je	LBB1_32
## %bb.54:                              ##   in Loop: Header=BB1_52 Depth=1
	vmovss	(%r14,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$2, %eax
	je	LBB1_39
## %bb.55:                              ##   in Loop: Header=BB1_52 Depth=1
	vmovss	(%r14,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	callq	___fpclassifyf
	cmpl	$5, %eax
	jne	LBB1_57
## %bb.56:                              ##   in Loop: Header=BB1_52 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.13(%rip), %rdi
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movl	$0, (%rax,%rbx,4)
LBB1_57:                                ##   in Loop: Header=BB1_52 Depth=1
	movl	-224(%rbp), %ebx        ## 4-byte Reload
	addl	$1, %ebx
	movq	-240(%rbp), %r14        ## 8-byte Reload
LBB1_58:                                ##   in Loop: Header=BB1_52 Depth=1
	addl	$1, %r12d
	cmpl	-284(%rbp), %r12d
	jl	LBB1_52
LBB1_62:
	movq	-296(%rbp), %rbx        ## 8-byte Reload
	leal	-1(%rbx), %r8d
	movq	-280(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	movq	%r14, %rdx
	xorl	%ecx, %ecx
	callq	_quickSort
	movl	$1, %ecx
	cmpl	$1000000, %ebx          ## imm = 0xF4240
	jg	LBB1_68
## %bb.63:
	movl	$500, %ecx              ## imm = 0x1F4
	cmpl	$100000, %ebx           ## imm = 0x186A0
	jg	LBB1_68
## %bb.64:
	movl	$1000, %ecx             ## imm = 0x3E8
	cmpl	$50000, %ebx            ## imm = 0xC350
	jg	LBB1_68
## %bb.65:
	movl	$5000, %ecx             ## imm = 0x1388
	cmpl	$20000, %ebx            ## imm = 0x4E20
	jg	LBB1_68
## %bb.66:
	movl	$10000, %ecx            ## imm = 0x2710
	cmpl	$5000, %ebx             ## imm = 0x1388
	jg	LBB1_68
## %bb.67:
	cmpl	$500, %ebx              ## imm = 0x1F4
	movl	$100000, %eax           ## imm = 0x186A0
	movl	$1000000, %ecx          ## imm = 0xF4240
	cmovgl	%eax, %ecx
LBB1_68:
	movq	-272(%rbp), %r12        ## 8-byte Reload
	movq	16(%r12), %rdi
	movl	%ecx, %ebx
	movl	%ecx, -224(%rbp)        ## 4-byte Spill
	callq	_puts
	leaq	L_.str.16(%rip), %rdi
	movl	$20, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.17(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	_printf
	movl	-212(%rbp), %esi
	leaq	L_.str.18(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.19(%rip), %rdi
	movq	-296(%rbp), %rbx        ## 8-byte Reload
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	16(%r12), %rdi
	leaq	L_.str.20(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	movq	%r15, -360(%rbp)        ## 8-byte Spill
	movq	%r13, -344(%rbp)        ## 8-byte Spill
	movl	-224(%rbp), %ecx        ## 4-byte Reload
	movq	-304(%rbp), %r12        ## 8-byte Reload
	je	LBB1_69
## %bb.76:
	movq	-272(%rbp), %rax        ## 8-byte Reload
	movq	16(%rax), %rdi
	leaq	L_.str.25(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	je	LBB1_77
## %bb.85:
	movq	-272(%rbp), %rax        ## 8-byte Reload
	movq	16(%rax), %rdi
	leaq	L_.str.34(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	movq	-312(%rbp), %rbx        ## 8-byte Reload
	je	LBB1_86
## %bb.92:
	movq	-272(%rbp), %rax        ## 8-byte Reload
	movq	16(%rax), %rdi
	leaq	L_.str.35(%rip), %rsi
	callq	_string_compare
	testl	%eax, %eax
	jne	LBB1_100
## %bb.93:
	movl	-212(%rbp), %esi
	movq	-296(%rbp), %r12        ## 8-byte Reload
	movl	%r12d, %edi
	movq	-280(%rbp), %rdx        ## 8-byte Reload
	movq	%r15, %rcx
	movq	%r14, %r8
	movq	-384(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	pushq	%rbx
	movq	-352(%rbp), %r14        ## 8-byte Reload
	pushq	%r14
	callq	_coo_csr
	addq	$16, %rsp
	movl	-212(%rbp), %r9d
	leaq	-316(%rbp), %rax
	leaq	-400(%rbp), %rcx
	leaq	-392(%rbp), %r8
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	pushq	%r12
	pushq	%rax
	callq	_csr_ell
	addq	$16, %rsp
	vcvtsi2sdl	%r12d, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	vcvtsi2sdl	%eax, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -336(%rbp)       ## 8-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r12d, %r12d
	movq	-304(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_94:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_95 Depth 2
	vmovsd	%xmm1, -272(%rbp)       ## 8-byte Spill
	movl	-212(%rbp), %edi
	movq	%r14, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r15
	movl	-224(%rbp), %ebx        ## 4-byte Reload
	.p2align	4, 0x90
LBB1_95:                                ##   Parent Loop BB1_94 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-400(%rbp), %rdi
	movq	-392(%rbp), %rsi
	movl	-212(%rbp), %edx
	movl	-316(%rbp), %ecx
	movq	%r13, %r8
	movq	%r14, %r9
	callq	_spmv_ell
	addl	$-1, %ebx
	jne	LBB1_95
## %bb.96:                              ##   in Loop: Header=BB1_94 Depth=1
	callq	_clock
	subq	%r15, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_98
## %bb.97:                              ##   in Loop: Header=BB1_94 Depth=1
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-336(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -208(%rbp,%r12,8)
LBB1_98:                                ##   in Loop: Header=BB1_94 Depth=1
	vmovsd	-272(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	addq	$1, %r12
	cmpq	$20, %r12
	jne	LBB1_94
	jmp	LBB1_99
LBB1_69:
	vcvtsi2sdl	%ebx, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	vcvtsi2sdl	%ecx, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -432(%rbp)       ## 8-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	movq	-360(%rbp), %r14        ## 8-byte Reload
	movq	-240(%rbp), %r13        ## 8-byte Reload
	movq	-344(%rbp), %rbx        ## 8-byte Reload
	movq	-296(%rbp), %r15        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_70:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_71 Depth 2
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -272(%rbp)       ## 8-byte Spill
	movl	-212(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -376(%rbp)        ## 8-byte Spill
	movl	-224(%rbp), %r12d       ## 4-byte Reload
	.p2align	4, 0x90
LBB1_71:                                ##   Parent Loop BB1_70 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-212(%rbp), %r8d
	subq	$8, %rsp
	movq	-280(%rbp), %rdi        ## 8-byte Reload
	movq	%r14, %rsi
	movq	%r13, %rdx
	movl	%r15d, %ecx
	movq	%rbx, %r9
	pushq	-304(%rbp)              ## 8-byte Folded Reload
	callq	_spmv_coo
	addq	$16, %rsp
	addl	$-1, %r12d
	jne	LBB1_71
## %bb.72:                              ##   in Loop: Header=BB1_70 Depth=1
	callq	_clock
	subq	-376(%rbp), %rax        ## 8-byte Folded Reload
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	movq	-336(%rbp), %rax        ## 8-byte Reload
	je	LBB1_74
## %bb.73:                              ##   in Loop: Header=BB1_70 Depth=1
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-432(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -208(%rbp,%rax,8)
LBB1_74:                                ##   in Loop: Header=BB1_70 Depth=1
	vmovsd	-272(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	addq	$1, %rax
	cmpq	$20, %rax
	movq	-304(%rbp), %r12        ## 8-byte Reload
	jne	LBB1_70
## %bb.75:
	vmovsd	LCPI1_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm2
	vmovsd	%xmm2, -224(%rbp)       ## 8-byte Spill
	vmulsd	-432(%rbp), %xmm0, %xmm1 ## 8-byte Folded Reload
	vdivsd	%xmm2, %xmm1, %xmm4
	vmovapd	%xmm4, -272(%rbp)       ## 16-byte Spill
	vsubsd	-208(%rbp), %xmm4, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-200(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-192(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-184(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-176(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-168(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-160(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-152(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-144(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-136(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-128(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-120(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-112(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-104(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-96(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-88(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-80(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-72(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovddup	%xmm4, %xmm2    ## xmm2 = xmm4[0,0]
	vsubpd	-64(%rbp), %xmm2, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vpermilpd	$1, %xmm2, %xmm2 ## xmm2 = xmm2[1,0]
	vaddsd	%xmm2, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.21(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	vmovaps	-272(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	leaq	L_.str.23(%rip), %rdi
	vmovsd	-224(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	-244(%rbp), %esi
	movq	%r12, %rdi
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	-360(%rbp), %r15        ## 8-byte Reload
	movq	-240(%rbp), %r14        ## 8-byte Reload
	movq	-312(%rbp), %rbx        ## 8-byte Reload
	movq	-344(%rbp), %r13        ## 8-byte Reload
LBB1_100:
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	je	LBB1_102
LBB1_101:
	callq	_fclose
LBB1_102:
	movq	%r13, %rdi
	callq	_free
	movq	%r12, %rdi
	callq	_free
	movq	-384(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-280(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	%r15, %rdi
	callq	_free
	movq	%r14, %rdi
	callq	_free
	movq	-352(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	%rbx, %rdi
	callq	_free
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB1_106
## %bb.103:
	xorl	%eax, %eax
	addq	$392, %rsp              ## imm = 0x188
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_77:
	movl	-212(%rbp), %esi
	movq	-296(%rbp), %rdi        ## 8-byte Reload
                                        ## kill: def $edi killed $edi killed $rdi
	movq	-280(%rbp), %rdx        ## 8-byte Reload
	movq	%r15, %rcx
	movq	%r14, %r8
	movq	-384(%rbp), %r9         ## 8-byte Reload
	pushq	-312(%rbp)              ## 8-byte Folded Reload
	pushq	-352(%rbp)              ## 8-byte Folded Reload
	callq	_coo_csr
	addq	$16, %rsp
	leaq	L_.str.26(%rip), %rdi
	xorl	%eax, %eax
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	callq	_printf
	movq	-296(%rbp), %rax        ## 8-byte Reload
	vcvtsi2sdl	%eax, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	vcvtsi2sdl	%eax, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -296(%rbp)       ## 8-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -272(%rbp)       ## 8-byte Spill
	movq	-352(%rbp), %rbx        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_78:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_79 Depth 2
	movl	-212(%rbp), %edi
	movq	%r12, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, -376(%rbp)        ## 8-byte Spill
	movl	-224(%rbp), %r15d       ## 4-byte Reload
	movq	-312(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_79:                                ##   Parent Loop BB1_78 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-212(%rbp), %ecx
	movq	-384(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	%r14, %rdx
	movq	%r13, %r8
	movq	%r12, %r9
	callq	_spmv_csr
	addl	$-1, %r15d
	jne	LBB1_79
## %bb.80:                              ##   in Loop: Header=BB1_78 Depth=1
	callq	_clock
	subq	-376(%rbp), %rax        ## 8-byte Folded Reload
	jne	LBB1_82
## %bb.81:                              ##   in Loop: Header=BB1_78 Depth=1
	movq	-336(%rbp), %r15        ## 8-byte Reload
	vmovsd	-208(%rbp,%r15,8), %xmm0 ## xmm0 = mem[0],zero
	vcvtusi2sdq	%rax, %xmm3, %xmm1
	jmp	LBB1_83
	.p2align	4, 0x90
LBB1_82:                                ##   in Loop: Header=BB1_78 Depth=1
	vcvtusi2sdq	%rax, %xmm3, %xmm1
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm0
	vmovsd	-296(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm0, %xmm2, %xmm0
	movq	-336(%rbp), %r15        ## 8-byte Reload
	vmovsd	%xmm0, -208(%rbp,%r15,8)
LBB1_83:                                ##   in Loop: Header=BB1_78 Depth=1
	movq	-344(%rbp), %r13        ## 8-byte Reload
	movq	-304(%rbp), %r12        ## 8-byte Reload
	movq	-240(%rbp), %r14        ## 8-byte Reload
	vmovsd	-272(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm2, -272(%rbp)       ## 8-byte Spill
	leaq	L_.str.27(%rip), %rdi
	movb	$1, %al
	callq	_printf
	addq	$1, %r15
	movq	%r15, -336(%rbp)        ## 8-byte Spill
	cmpq	$20, %r15
	jne	LBB1_78
## %bb.84:
	leaq	L_str(%rip), %rdi
	callq	_puts
	vmovsd	-296(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmulsd	LCPI1_2(%rip), %xmm0, %xmm0
	vmovsd	-272(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, -224(%rbp)       ## 8-byte Spill
	vdivsd	%xmm1, %xmm0, %xmm3
	vmovapd	%xmm3, -336(%rbp)       ## 16-byte Spill
	vsubsd	-208(%rbp), %xmm3, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-200(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-192(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-184(%rbp), %xmm3, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-176(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-168(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-160(%rbp), %xmm3, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-152(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-144(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-136(%rbp), %xmm3, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-128(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-120(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-112(%rbp), %xmm3, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-104(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-96(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-88(%rbp), %xmm3, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-80(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-72(%rbp), %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovddup	%xmm3, %xmm1    ## xmm1 = xmm3[0,0]
	vsubpd	-64(%rbp), %xmm1, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm1, %xmm1 ## xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -376(%rbp)       ## 8-byte Spill
	leaq	_comp_float(%rip), %rcx
	leaq	-208(%rbp), %rdi
	movl	$20, %esi
	movl	$8, %edx
	callq	_qsort
	vmovsd	-128(%rbp), %xmm0       ## xmm0 = mem[0],zero
	vaddsd	-136(%rbp), %xmm0, %xmm0
	vmulsd	LCPI1_3(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -344(%rbp)       ## 4-byte Spill
	leaq	L_.str.29(%rip), %rdi
	vmovsd	LCPI1_4(%rip), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	vmovsd	-272(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	leaq	L_.str.30(%rip), %rdi
	movb	$1, %al
	callq	_printf
	vmovss	-344(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -272(%rbp)       ## 8-byte Spill
	leaq	L_.str.31(%rip), %rdi
	movb	$1, %al
	callq	_printf
	vmovsd	-376(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vdivsd	LCPI1_2(%rip), %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.32(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	vmovaps	-336(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	leaq	L_.str.33(%rip), %rdi
	vmovsd	-272(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	leaq	L_.str.23(%rip), %rdi
	vmovsd	-224(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	-244(%rbp), %esi
	movq	%r12, %rdi
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	-312(%rbp), %rbx        ## 8-byte Reload
	movq	-360(%rbp), %r15        ## 8-byte Reload
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	jne	LBB1_101
	jmp	LBB1_102
LBB1_86:
	movl	-212(%rbp), %esi
	movq	-296(%rbp), %r12        ## 8-byte Reload
	movl	%r12d, %edi
	movq	-280(%rbp), %rdx        ## 8-byte Reload
	movq	%r15, %rcx
	movq	%r14, %r8
	movq	-384(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	pushq	%rbx
	movq	-352(%rbp), %r14        ## 8-byte Reload
	pushq	%r14
	callq	_coo_csr
	addq	$16, %rsp
	movl	-212(%rbp), %r9d
	subq	$8, %rsp
	leaq	-420(%rbp), %rax
	movq	%rbx, %rdx
	leaq	-316(%rbp), %rbx
	leaq	-400(%rbp), %rcx
	leaq	-392(%rbp), %r8
	movq	%r15, %rdi
	movq	%r14, %rsi
	pushq	%r12
	pushq	%rax
	pushq	%rbx
	callq	_csr_dia
	addq	$32, %rsp
	vcvtsi2sdl	%r12d, %xmm2, %xmm0
	vmulsd	LCPI1_0(%rip), %xmm0, %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	vcvtsi2sdl	%eax, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -336(%rbp)       ## 8-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r12d, %r12d
	movq	-304(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB1_87:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_88 Depth 2
	vmovsd	%xmm1, -272(%rbp)       ## 8-byte Spill
	movl	-212(%rbp), %edi
	movq	%r14, %rsi
	callq	_zero_arr
	callq	_clock
	movq	%rax, %r15
	movl	-224(%rbp), %ebx        ## 4-byte Reload
	.p2align	4, 0x90
LBB1_88:                                ##   Parent Loop BB1_87 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-400(%rbp), %rdi
	movq	-392(%rbp), %rsi
	movl	-212(%rbp), %edx
	movl	-316(%rbp), %ecx
	movl	-420(%rbp), %r8d
	subq	$8, %rsp
	movq	%r13, %r9
	pushq	%r14
	callq	_spmv_dia
	addq	$16, %rsp
	addl	$-1, %ebx
	jne	LBB1_88
## %bb.89:                              ##   in Loop: Header=BB1_87 Depth=1
	callq	_clock
	subq	%r15, %rax
	vcvtusi2sdq	%rax, %xmm3, %xmm0
	je	LBB1_91
## %bb.90:                              ##   in Loop: Header=BB1_87 Depth=1
	vdivsd	LCPI1_1(%rip), %xmm0, %xmm1
	vmovsd	-336(%rbp), %xmm2       ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -208(%rbp,%r12,8)
LBB1_91:                                ##   in Loop: Header=BB1_87 Depth=1
	vmovsd	-272(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	addq	$1, %r12
	cmpq	$20, %r12
	jne	LBB1_87
LBB1_99:
	vmovsd	LCPI1_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	vdivsd	LCPI1_1(%rip), %xmm1, %xmm2
	vmovsd	%xmm2, -224(%rbp)       ## 8-byte Spill
	vmulsd	-336(%rbp), %xmm0, %xmm1 ## 8-byte Folded Reload
	vdivsd	%xmm2, %xmm1, %xmm4
	vmovapd	%xmm4, -272(%rbp)       ## 16-byte Spill
	vsubsd	-208(%rbp), %xmm4, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-200(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-192(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-184(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-176(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-168(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-160(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-152(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-144(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-136(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-128(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-120(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-112(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-104(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-96(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-88(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	-80(%rbp), %xmm4, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	-72(%rbp), %xmm4, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovddup	%xmm4, %xmm2    ## xmm2 = xmm4[0,0]
	vsubpd	-64(%rbp), %xmm2, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vpermilpd	$1, %xmm2, %xmm2 ## xmm2 = xmm2[1,0]
	vaddsd	%xmm2, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	leaq	L_.str.32(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	vmovaps	-272(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	leaq	L_.str.23(%rip), %rdi
	vmovsd	-224(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	-244(%rbp), %esi
	movq	-304(%rbp), %r12        ## 8-byte Reload
	movq	%r12, %rdi
	callq	_fletcher_sum
	leaq	L_.str.24(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	-392(%rbp), %rdi
	callq	_free
	movq	-400(%rbp), %rdi
	callq	_free
	movq	-360(%rbp), %r15        ## 8-byte Reload
	movq	-312(%rbp), %rbx        ## 8-byte Reload
	movq	-240(%rbp), %r14        ## 8-byte Reload
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	jne	LBB1_101
	jmp	LBB1_102
LBB1_106:
	callq	___stack_chk_fail
LBB1_32:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.11(%rip), %rdi
	movl	$16, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_39:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.12(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_15:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.5(%rip), %rdi
	jmp	LBB1_10
LBB1_104:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	(%r14), %rdx
	leaq	L_.str(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB1_105:
	movl	$1, %edi
	callq	_exit
LBB1_3:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$40, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_9:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	jmp	LBB1_10
LBB1_13:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.4(%rip), %rdi
LBB1_10:
	movl	$34, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_17:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.6(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_19:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.7(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_22:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.8(%rip), %rdi
	movl	$32, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_25:
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

L_.str.16:                              ## @.str.16
	.asciz	"Outer %d\n"

L_.str.17:                              ## @.str.17
	.asciz	"Inner %d\n"

L_.str.18:                              ## @.str.18
	.asciz	"N %d\n"

L_.str.19:                              ## @.str.19
	.asciz	"NNZ %d\n"

L_.str.20:                              ## @.str.20
	.asciz	"coo"

L_.str.21:                              ## @.str.21
	.asciz	"SD %g\n"

L_.str.22:                              ## @.str.22
	.asciz	"MFLOPS_s %g\n"

L_.str.23:                              ## @.str.23
	.asciz	"Time %g\n"

L_.str.24:                              ## @.str.24
	.asciz	"Fletcher_sum %d\n"

L_.str.25:                              ## @.str.25
	.asciz	"csr"

L_.str.26:                              ## @.str.26
	.asciz	"Exec arr = [ "

L_.str.27:                              ## @.str.27
	.asciz	"%g, "

L_.str.29:                              ## @.str.29
	.asciz	"clock_s: %g\n"

L_.str.30:                              ## @.str.30
	.asciz	"mean: %g\n"

L_.str.31:                              ## @.str.31
	.asciz	"median: %g\n"

L_.str.32:                              ## @.str.32
	.asciz	"SD %f\n"

L_.str.33:                              ## @.str.33
	.asciz	"MFLOPS_median %g\n"

L_.str.34:                              ## @.str.34
	.asciz	"dia"

L_.str.35:                              ## @.str.35
	.asciz	"ell"

L_str:                                  ## @str
	.asciz	"]"


.subsections_via_symbols
