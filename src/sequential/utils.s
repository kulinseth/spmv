	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_count_uniq_elems       ## -- Begin function count_uniq_elems
	.p2align	4, 0x90
_count_uniq_elems:                      ## @count_uniq_elems
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $esi killed $esi def $rsi
                                        ## kill: def $edi killed $edi def $rdi
	leal	1(%rsi), %r8d
	xorl	%eax, %eax
	cmpl	%edi, %r8d
	jge	LBB0_7
## %bb.1:
	movslq	%r8d, %r8
	movl	%esi, %r9d
	notl	%r9d
	addl	%edi, %r9d
	leal	-2(%rdi), %eax
	andl	$1, %r9d
	cmpl	%esi, %eax
	jne	LBB0_3
## %bb.2:
	xorl	%eax, %eax
	testl	%r9d, %r9d
	jne	LBB0_6
	jmp	LBB0_7
LBB0_3:
	leal	(%rsi,%r9), %r10d
	addl	$1, %r10d
	subl	%edi, %r10d
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rdx,%r8,4), %esi
	movl	%esi, %edi
	sarl	$31, %edi
	shrl	$28, %edi
	addl	%esi, %edi
	sarl	$4, %edi
	movslq	%edi, %rsi
	movl	(%rcx,%rsi,4), %edi
	cmpl	$1, %edi
	adcl	$0, %eax
	addl	$1, %edi
	movl	%edi, (%rcx,%rsi,4)
	movl	4(%rdx,%r8,4), %esi
	movl	%esi, %edi
	sarl	$31, %edi
	shrl	$28, %edi
	addl	%esi, %edi
	sarl	$4, %edi
	movslq	%edi, %rsi
	movl	(%rcx,%rsi,4), %edi
	cmpl	$1, %edi
	adcl	$0, %eax
	addl	$1, %edi
	movl	%edi, (%rcx,%rsi,4)
	addq	$2, %r8
	addl	$2, %r10d
	jne	LBB0_4
## %bb.5:
	testl	%r9d, %r9d
	je	LBB0_7
LBB0_6:
	movl	(%rdx,%r8,4), %edx
	movl	%edx, %esi
	sarl	$31, %esi
	shrl	$28, %esi
	addl	%edx, %esi
	sarl	$4, %esi
	movslq	%esi, %rdx
	movl	(%rcx,%rdx,4), %esi
	leal	1(%rsi), %edi
	movl	%edi, (%rcx,%rdx,4)
	cmpl	$1, %esi
	adcl	$0, %eax
LBB0_7:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_string_compare         ## -- Begin function string_compare
	.p2align	4, 0x90
_string_compare:                        ## @string_compare
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r13
	callq	_strlen
	movq	%rax, %r12
	movq	%r15, %rdi
	callq	_strlen
	movl	$-1, %r14d
	cmpq	%rax, %r12
	jne	LBB1_8
## %bb.1:
	movsbl	(%r13), %edi
	testl	%edi, %edi
	je	LBB1_7
## %bb.2:
	callq	___tolower
	movl	%eax, %r12d
	movsbl	(%r15), %edi
	callq	___tolower
	cmpl	%eax, %r12d
	jne	LBB1_8
## %bb.3:
	movl	$1, %ebx
	.p2align	4, 0x90
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	callq	_strlen
	cmpq	%rbx, %rax
	jbe	LBB1_7
## %bb.5:                               ##   in Loop: Header=BB1_4 Depth=1
	movsbl	(%r13,%rbx), %edi
	callq	___tolower
	movl	%eax, %r12d
	movsbl	(%r15,%rbx), %edi
	callq	___tolower
	addq	$1, %rbx
	cmpl	%eax, %r12d
	je	LBB1_4
	jmp	LBB1_8
LBB1_7:
	xorl	%r14d, %r14d
LBB1_8:
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function count_nnz
LCPI2_0:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_count_nnz
	.p2align	4, 0x90
_count_nnz:                             ## @count_nnz
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	leaq	-44(%rbp), %rsi
	callq	_mm_read_banner
	testl	%eax, %eax
	jne	LBB2_24
## %bb.1:
	cmpb	$67, -42(%rbp)
	jne	LBB2_4
## %bb.2:
	cmpb	$77, -44(%rbp)
	jne	LBB2_4
## %bb.3:
	cmpb	$67, -43(%rbp)
	je	LBB2_25
LBB2_4:
	leaq	-72(%rbp), %rsi
	leaq	-68(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	movq	%r14, %rdi
	callq	_mm_read_mtx_crd_size
	testl	%eax, %eax
	jne	LBB2_26
## %bb.5:
	cmpb	$83, -41(%rbp)
	jne	LBB2_10
## %bb.6:
	cmpb	$80, -42(%rbp)
	movl	-48(%rbp), %eax
	jne	LBB2_13
## %bb.7:
	testl	%eax, %eax
	jle	LBB2_22
## %bb.8:
	leaq	-56(%rbp), %r12
	leaq	-52(%rbp), %r13
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB2_9:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.4(%rip), %rsi
	movq	%r12, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-56(%rbp), %eax
	xorl	%ecx, %ecx
	cmpl	-52(%rbp), %eax
	sete	%cl
	subl	%ecx, %ebx
	addl	$2, %ebx
	addl	$1, %r15d
	cmpl	-48(%rbp), %r15d
	jl	LBB2_9
	jmp	LBB2_23
LBB2_10:
	cmpl	$0, -48(%rbp)
	jle	LBB2_22
## %bb.11:
	leaq	-52(%rbp), %r13
	leaq	-64(%rbp), %r15
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB2_12:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.3(%rip), %rsi
	leaq	-56(%rbp), %rdx
	movq	%r13, %rcx
	movq	%r15, %r8
	xorl	%eax, %eax
	callq	_fscanf
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	vucomisd	-64(%rbp), %xmm0
	setne	%al
	addl	%eax, %ebx
	addl	$1, %r12d
	cmpl	-48(%rbp), %r12d
	jl	LBB2_12
	jmp	LBB2_23
LBB2_13:
	testl	%eax, %eax
	jle	LBB2_22
## %bb.14:
	leaq	-52(%rbp), %r13
	leaq	-64(%rbp), %r15
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB2_15:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.3(%rip), %rsi
	leaq	-56(%rbp), %rdx
	movq	%r13, %rcx
	movq	%r15, %r8
	xorl	%eax, %eax
	callq	_fscanf
	vxorps	%xmm0, %xmm0, %xmm0
	vucomisd	-64(%rbp), %xmm0
	je	LBB2_18
## %bb.16:                              ##   in Loop: Header=BB2_15 Depth=1
	movl	-56(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jne	LBB2_19
## %bb.17:                              ##   in Loop: Header=BB2_15 Depth=1
	addl	$1, %ebx
LBB2_18:                                ##   in Loop: Header=BB2_15 Depth=1
	addl	$1, %r12d
	cmpl	-48(%rbp), %r12d
	jl	LBB2_15
	jmp	LBB2_23
	.p2align	4, 0x90
LBB2_19:                                ##   in Loop: Header=BB2_15 Depth=1
	addl	$2, %ebx
	addl	$1, %r12d
	cmpl	-48(%rbp), %r12d
	jl	LBB2_15
	jmp	LBB2_23
LBB2_22:
	xorl	%ebx, %ebx
LBB2_23:
	movl	%ebx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_24:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str(%rip), %rdi
	movl	$40, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB2_25:
	movq	___stderrp@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	leaq	L_.str.1(%rip), %rdi
	movl	$41, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%rbx), %rbx
	leaq	-44(%rbp), %rdi
	callq	_mm_typecode_to_str
	leaq	L_.str.2(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
LBB2_26:
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_swap                   ## -- Begin function swap
	.p2align	4, 0x90
_swap:                                  ## @swap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_swap_val               ## -- Begin function swap_val
	.p2align	4, 0x90
_swap_val:                              ## @swap_val
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_quickSort              ## -- Begin function quickSort
	.p2align	4, 0x90
_quickSort:                             ## @quickSort
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r10d
                                        ## kill: def $ecx killed $ecx def $rcx
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r13
	.p2align	4, 0x90
LBB5_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_3 Depth 2
                                        ##       Child Loop BB5_20 Depth 3
                                        ##       Child Loop BB5_21 Depth 3
	movl	%r10d, %r8d
	movl	%ecx, %r14d
	cmpl	%r10d, %ecx
	jg	LBB5_16
## %bb.2:                               ##   in Loop: Header=BB5_1 Depth=1
	leal	(%rcx,%r10), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	sarl	%edx
	movslq	%edx, %rax
	movl	(%r13,%rax,4), %ebx
	movl	(%r12,%rax,4), %r9d
	movl	%ecx, %r14d
	movl	%r10d, %r8d
	.p2align	4, 0x90
LBB5_3:                                 ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB5_20 Depth 3
                                        ##       Child Loop BB5_21 Depth 3
	movslq	%r14d, %rsi
	shlq	$2, %rsi
	movl	(%r13,%rsi), %edi
	cmpl	%ebx, %edi
	jge	LBB5_5
	.p2align	4, 0x90
LBB5_20:                                ##   Parent Loop BB5_1 Depth=1
                                        ##     Parent Loop BB5_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	addq	$4, %rsi
	addl	$1, %r14d
	movl	(%r13,%rsi), %edi
	cmpl	%ebx, %edi
	jl	LBB5_20
LBB5_5:                                 ##   in Loop: Header=BB5_3 Depth=2
	jne	LBB5_8
## %bb.6:                               ##   in Loop: Header=BB5_3 Depth=2
	cmpl	%r9d, (%r12,%rsi)
	jl	LBB5_20
## %bb.7:                               ##   in Loop: Header=BB5_3 Depth=2
	movl	%ebx, %edi
LBB5_8:                                 ##   in Loop: Header=BB5_3 Depth=2
	movslq	%r8d, %rdx
	shlq	$2, %rdx
	movl	(%r13,%rdx), %eax
	cmpl	%ebx, %eax
	jle	LBB5_10
	.p2align	4, 0x90
LBB5_21:                                ##   Parent Loop BB5_1 Depth=1
                                        ##     Parent Loop BB5_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	addq	$-4, %rdx
	addl	$-1, %r8d
	movl	(%r13,%rdx), %eax
	cmpl	%ebx, %eax
	jg	LBB5_21
LBB5_10:                                ##   in Loop: Header=BB5_3 Depth=2
	jne	LBB5_13
## %bb.11:                              ##   in Loop: Header=BB5_3 Depth=2
	cmpl	%r9d, (%r12,%rdx)
	jg	LBB5_21
## %bb.12:                              ##   in Loop: Header=BB5_3 Depth=2
	movl	%ebx, %eax
LBB5_13:                                ##   in Loop: Header=BB5_3 Depth=2
	cmpl	%r8d, %r14d
	jg	LBB5_15
## %bb.14:                              ##   in Loop: Header=BB5_3 Depth=2
	movl	%eax, (%r13,%rsi)
	movl	%edi, (%r13,%rdx)
	movl	(%r12,%rsi), %eax
	movl	(%r12,%rdx), %edi
	movl	%edi, (%r12,%rsi)
	movl	%eax, (%r12,%rdx)
	movl	(%r15,%rsi), %eax
	movl	(%r15,%rdx), %edi
	movl	%edi, (%r15,%rsi)
	movl	%eax, (%r15,%rdx)
	addl	$1, %r14d
	addl	$-1, %r8d
LBB5_15:                                ##   in Loop: Header=BB5_3 Depth=2
	cmpl	%r8d, %r14d
	jle	LBB5_3
LBB5_16:                                ##   in Loop: Header=BB5_1 Depth=1
	cmpl	%ecx, %r8d
	jle	LBB5_18
## %bb.17:                              ##   in Loop: Header=BB5_1 Depth=1
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
                                        ## kill: def $ecx killed $ecx killed $rcx
	movq	%r10, %rbx
	callq	_quickSort
	movq	%rbx, %r10
LBB5_18:                                ##   in Loop: Header=BB5_1 Depth=1
	movl	%r14d, %ecx
	cmpl	%r10d, %r14d
	jl	LBB5_1
## %bb.19:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
	.p2align	6               ## -- Begin function init_arr
LCPI6_0:
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	6                       ## 0x6
	.long	7                       ## 0x7
	.long	8                       ## 0x8
	.long	9                       ## 0x9
	.long	10                      ## 0xa
	.long	11                      ## 0xb
	.long	12                      ## 0xc
	.long	13                      ## 0xd
	.long	14                      ## 0xe
	.long	15                      ## 0xf
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI6_1:
	.long	16                      ## 0x10
LCPI6_2:
	.long	32                      ## 0x20
LCPI6_3:
	.long	48                      ## 0x30
LCPI6_4:
	.long	64                      ## 0x40
LCPI6_5:
	.long	80                      ## 0x50
LCPI6_6:
	.long	96                      ## 0x60
LCPI6_7:
	.long	112                     ## 0x70
LCPI6_8:
	.long	128                     ## 0x80
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_init_arr
	.p2align	4, 0x90
_init_arr:                              ## @init_arr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%edi, %edi
	jle	LBB6_11
## %bb.1:
	movl	%edi, %eax
	cmpl	$64, %edi
	jae	LBB6_3
## %bb.2:
	xorl	%ecx, %ecx
	jmp	LBB6_10
LBB6_3:
	movl	%eax, %ecx
	andl	$-64, %ecx
	leaq	-64(%rcx), %rdi
	movq	%rdi, %rdx
	shrq	$6, %rdx
	addq	$1, %rdx
	movl	%edx, %r8d
	andl	$1, %r8d
	testq	%rdi, %rdi
	je	LBB6_4
## %bb.5:
	movl	$1, %edi
	subq	%rdx, %rdi
	addq	%r8, %rdi
	addq	$-1, %rdi
	vmovdqa64	LCPI6_0(%rip), %zmm0 ## zmm0 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB6_6:                                 ## =>This Inner Loop Header: Depth=1
	vpaddd	LCPI6_1(%rip){1to16}, %zmm0, %zmm1
	vpaddd	LCPI6_2(%rip){1to16}, %zmm0, %zmm2
	vpaddd	LCPI6_3(%rip){1to16}, %zmm0, %zmm3
	vcvtdq2ps	%zmm0, %zmm4
	vcvtdq2ps	%zmm1, %zmm1
	vcvtdq2ps	%zmm2, %zmm2
	vcvtdq2ps	%zmm3, %zmm3
	vmovups	%zmm4, (%rsi,%rdx,4)
	vmovups	%zmm1, 64(%rsi,%rdx,4)
	vmovups	%zmm2, 128(%rsi,%rdx,4)
	vmovups	%zmm3, 192(%rsi,%rdx,4)
	vpaddd	LCPI6_4(%rip){1to16}, %zmm0, %zmm1
	vpaddd	LCPI6_5(%rip){1to16}, %zmm0, %zmm2
	vpaddd	LCPI6_6(%rip){1to16}, %zmm0, %zmm3
	vpaddd	LCPI6_7(%rip){1to16}, %zmm0, %zmm4
	vcvtdq2ps	%zmm1, %zmm1
	vcvtdq2ps	%zmm2, %zmm2
	vcvtdq2ps	%zmm3, %zmm3
	vcvtdq2ps	%zmm4, %zmm4
	vmovups	%zmm1, 256(%rsi,%rdx,4)
	vmovups	%zmm2, 320(%rsi,%rdx,4)
	vmovups	%zmm3, 384(%rsi,%rdx,4)
	vmovups	%zmm4, 448(%rsi,%rdx,4)
	subq	$-128, %rdx
	vpaddd	LCPI6_8(%rip){1to16}, %zmm0, %zmm0
	addq	$2, %rdi
	jne	LBB6_6
## %bb.7:
	testq	%r8, %r8
	je	LBB6_9
LBB6_8:
	vpaddd	LCPI6_1(%rip){1to16}, %zmm0, %zmm1
	vpaddd	LCPI6_2(%rip){1to16}, %zmm0, %zmm2
	vpaddd	LCPI6_3(%rip){1to16}, %zmm0, %zmm3
	vcvtdq2ps	%zmm0, %zmm0
	vcvtdq2ps	%zmm1, %zmm1
	vcvtdq2ps	%zmm2, %zmm2
	vcvtdq2ps	%zmm3, %zmm3
	vmovdqu64	%zmm0, (%rsi,%rdx,4)
	vmovups	%zmm1, 64(%rsi,%rdx,4)
	vmovups	%zmm2, 128(%rsi,%rdx,4)
	vmovups	%zmm3, 192(%rsi,%rdx,4)
LBB6_9:
	cmpq	%rax, %rcx
	je	LBB6_11
	.p2align	4, 0x90
LBB6_10:                                ## =>This Inner Loop Header: Depth=1
	vcvtsi2ssl	%ecx, %xmm5, %xmm0
	vmovd	%xmm0, (%rsi,%rcx,4)
	addq	$1, %rcx
	cmpq	%rcx, %rax
	jne	LBB6_10
LBB6_11:
	popq	%rbp
	vzeroupper
	retq
LBB6_4:
	vmovdqa64	LCPI6_0(%rip), %zmm0 ## zmm0 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	xorl	%edx, %edx
	testq	%r8, %r8
	jne	LBB6_8
	jmp	LBB6_9
	.cfi_endproc
                                        ## -- End function
	.globl	_zero_arr               ## -- Begin function zero_arr
	.p2align	4, 0x90
_zero_arr:                              ## @zero_arr
	.cfi_startproc
## %bb.0:
	testl	%edi, %edi
	jle	LBB7_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	shlq	$2, %rax
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	___bzero
	popq	%rbp
LBB7_2:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_arr              ## -- Begin function print_arr
	.p2align	4, 0x90
_print_arr:                             ## @print_arr
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movl	%edi, %r14d
	leaq	L_.str.5(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	testl	%r14d, %r14d
	jle	LBB8_5
## %bb.1:
	movslq	%r14d, %rax
	movl	%r14d, %ebx
	shlq	$3, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	leaq	L_.str.6(%rip), %r14
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_3 Depth 2
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB8_3:                                 ##   Parent Loop BB8_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovsd	(%r12,%r15,8), %xmm0    ## xmm0 = mem[0],zero
	movq	%r14, %rdi
	movb	$1, %al
	callq	_printf
	addq	$1, %r15
	cmpq	%r15, %rbx
	jne	LBB8_3
## %bb.4:                               ##   in Loop: Header=BB8_2 Depth=1
	movl	$10, %edi
	callq	_putchar
	addq	$1, %r13
	addq	-48(%rbp), %r12         ## 8-byte Folded Reload
	cmpq	%r15, %r13
	jne	LBB8_2
LBB8_5:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_sort                   ## -- Begin function sort
	.p2align	4, 0x90
_sort:                                  ## @sort
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
                                        ## kill: def $esi killed $esi def $rsi
	movl	%edi, %r8d
	notl	%r8d
	addl	%esi, %r8d
	testl	%r8d, %r8d
	jle	LBB9_17
## %bb.1:
	movslq	%edi, %r11
	movq	%r11, %rax
	notq	%rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	leaq	1(%r11), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	leal	-1(%rsi), %r12d
	movq	-48(%rbp), %rax         ## 8-byte Reload
	leaq	8(%rax), %rax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	leaq	8(%rdx), %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB9_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_11 Depth 2
	movl	%r13d, %eax
	notl	%eax
	addl	%esi, %eax
	movl	%eax, %r9d
	subl	%edi, %r9d
	jle	LBB9_16
## %bb.3:                               ##   in Loop: Header=BB9_2 Depth=1
	movslq	%eax, %r10
	movl	(%rdx,%r11,4), %ebx
	testb	$1, %r9b
	jne	LBB9_5
## %bb.4:                               ##   in Loop: Header=BB9_2 Depth=1
	movq	%r11, %r14
	addq	-80(%rbp), %r10         ## 8-byte Folded Reload
	jne	LBB9_10
	jmp	LBB9_16
	.p2align	4, 0x90
LBB9_5:                                 ##   in Loop: Header=BB9_2 Depth=1
	movl	4(%rdx,%r11,4), %eax
	cmpl	%eax, %ebx
	jle	LBB9_6
## %bb.7:                               ##   in Loop: Header=BB9_2 Depth=1
	movl	%eax, (%rdx,%r11,4)
	movl	%ebx, 4(%rdx,%r11,4)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	vcvttss2si	(%rax,%r11,4), %r9d
	movl	4(%rax,%r11,4), %ecx
	movl	%ecx, (%rax,%r11,4)
	vcvtsi2ssl	%r9d, %xmm1, %xmm0
	vmovss	%xmm0, 4(%rax,%r11,4)
	movq	-56(%rbp), %r14         ## 8-byte Reload
	addq	-80(%rbp), %r10         ## 8-byte Folded Reload
	jne	LBB9_10
	jmp	LBB9_16
LBB9_6:                                 ##   in Loop: Header=BB9_2 Depth=1
	movl	%eax, %ebx
	movq	-56(%rbp), %r14         ## 8-byte Reload
	addq	-80(%rbp), %r10         ## 8-byte Folded Reload
	je	LBB9_16
LBB9_10:                                ##   in Loop: Header=BB9_2 Depth=1
	movslq	%r12d, %r9
	subq	%r14, %r9
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r14,4), %r10
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r14,4), %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB9_11:                                ##   Parent Loop BB9_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-4(%r14,%r15,4), %eax
	cmpl	%eax, %ebx
	jle	LBB9_12
## %bb.13:                              ##   in Loop: Header=BB9_11 Depth=2
	movl	%eax, -8(%r14,%r15,4)
	movl	%ebx, -4(%r14,%r15,4)
	vcvttss2si	-8(%r10,%r15,4), %eax
	movl	-4(%r10,%r15,4), %ecx
	movl	%ecx, -8(%r10,%r15,4)
	vcvtsi2ssl	%eax, %xmm1, %xmm0
	vmovss	%xmm0, -4(%r10,%r15,4)
	movl	(%r14,%r15,4), %eax
	cmpl	%eax, %ebx
	jg	LBB9_18
LBB9_15:                                ##   in Loop: Header=BB9_11 Depth=2
	movl	%eax, %ebx
	addq	$2, %r15
	cmpq	%r15, %r9
	jne	LBB9_11
	jmp	LBB9_16
	.p2align	4, 0x90
LBB9_12:                                ##   in Loop: Header=BB9_11 Depth=2
	movl	%eax, %ebx
	movl	(%r14,%r15,4), %eax
	cmpl	%eax, %ebx
	jle	LBB9_15
LBB9_18:                                ##   in Loop: Header=BB9_11 Depth=2
	movl	%eax, -4(%r14,%r15,4)
	movl	%ebx, (%r14,%r15,4)
	vcvttss2si	-4(%r10,%r15,4), %eax
	movl	(%r10,%r15,4), %ecx
	movl	%ecx, -4(%r10,%r15,4)
	vcvtsi2ssl	%eax, %xmm1, %xmm0
	vmovss	%xmm0, (%r10,%r15,4)
	addq	$2, %r15
	cmpq	%r15, %r9
	jne	LBB9_11
	.p2align	4, 0x90
LBB9_16:                                ##   in Loop: Header=BB9_2 Depth=1
	addl	$1, %r13d
	addl	$-1, %r12d
	cmpl	%r8d, %r13d
	jne	LBB9_2
LBB9_17:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cmp                    ## -- Begin function cmp
	.p2align	4, 0x90
_cmp:                                   ## @cmp
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testl	%edx, %edx
	jle	LBB10_5
## %bb.1:
	movq	%rsi, %r14
	movq	%rdi, %r12
	movl	%edx, %r13d
	leaq	L_.str.8(%rip), %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB10_2:                                ## =>This Inner Loop Header: Depth=1
	vmovss	(%r12,%rbx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vucomiss	(%r14,%rbx,4), %xmm0
	jne	LBB10_3
	jnp	LBB10_4
LBB10_3:                                ##   in Loop: Header=BB10_2 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	%r15, %rsi
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	_fprintf
LBB10_4:                                ##   in Loop: Header=BB10_2 Depth=1
	addq	$1, %rbx
	cmpq	%rbx, %r13
	jne	LBB10_2
LBB10_5:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_matlab_modulo          ## -- Begin function matlab_modulo
	.p2align	4, 0x90
_matlab_modulo:                         ## @matlab_modulo
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vdivsd	%xmm1, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function fletcher_sum
LCPI12_0:
	.quad	4643176031446892544     ## double 255
LCPI12_1:
	.quad	4643211215818981376     ## double 256
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fletcher_sum
	.p2align	4, 0x90
_fletcher_sum:                          ## @fletcher_sum
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%esi, %esi
	jle	LBB12_1
## %bb.2:
	movl	%esi, %edx
	movl	%edx, %eax
	andl	$1, %eax
	cmpl	$1, %esi
	jne	LBB12_8
## %bb.3:
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	testq	%rax, %rax
	jne	LBB12_5
	jmp	LBB12_6
LBB12_1:
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	popq	%rbp
	retq
LBB12_8:
	subq	%rax, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovsd	LCPI12_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB12_9:                                ## =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rcx,4), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmovss	4(%rdi,%rcx,4), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm0, %xmm0
	vcvtss2sd	%xmm4, %xmm4, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm0, %xmm0
	addq	$2, %rcx
	cmpq	%rcx, %rdx
	jne	LBB12_9
## %bb.4:
	testq	%rax, %rax
	je	LBB12_6
LBB12_5:
	vmovss	(%rdi,%rcx,4), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vmovsd	LCPI12_0(%rip), %xmm3   ## xmm3 = mem[0],zero
	vaddsd	%xmm2, %xmm1, %xmm1
	vdivsd	%xmm3, %xmm1, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
LBB12_6:
	vmulsd	LCPI12_1(%rip), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function fletcher_sum_1d_array_int
LCPI13_0:
	.quad	4643176031446892544     ## double 255
LCPI13_1:
	.quad	4643211215818981376     ## double 256
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fletcher_sum_1d_array_int
	.p2align	4, 0x90
_fletcher_sum_1d_array_int:             ## @fletcher_sum_1d_array_int
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%esi, %esi
	jle	LBB13_1
## %bb.2:
	movl	%esi, %edx
	movl	%edx, %eax
	andl	$1, %eax
	cmpl	$1, %esi
	jne	LBB13_8
## %bb.3:
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	testq	%rax, %rax
	jne	LBB13_5
	jmp	LBB13_6
LBB13_1:
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	popq	%rbp
	retq
LBB13_8:
	subq	%rax, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovsd	LCPI13_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB13_9:                                ## =>This Inner Loop Header: Depth=1
	vcvtsi2sdl	(%rdi,%rcx,4), %xmm4, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm0, %xmm0
	vcvtsi2sdl	4(%rdi,%rcx,4), %xmm4, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm3
	vroundsd	$9, %xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm0, %xmm0
	addq	$2, %rcx
	cmpq	%rcx, %rdx
	jne	LBB13_9
## %bb.4:
	testq	%rax, %rax
	je	LBB13_6
LBB13_5:
	vcvtsi2sdl	(%rdi,%rcx,4), %xmm4, %xmm2
	vmovsd	LCPI13_0(%rip), %xmm3   ## xmm3 = mem[0],zero
	vaddsd	%xmm2, %xmm1, %xmm1
	vdivsd	%xmm3, %xmm1, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
LBB13_6:
	vmulsd	LCPI13_1(%rip), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Could not process Matrix Market banner.\n"

L_.str.1:                               ## @.str.1
	.asciz	"Sorry, this application does not support "

L_.str.2:                               ## @.str.2
	.asciz	"Market Market type: [%s]\n"

L_.str.3:                               ## @.str.3
	.asciz	"%d %d %lf\n"

L_.str.4:                               ## @.str.4
	.asciz	"%d %d\n"

L_.str.5:                               ## @.str.5
	.asciz	"\n%s\n"

L_.str.6:                               ## @.str.6
	.asciz	"%g\t"

L_.str.8:                               ## @.str.8
	.asciz	"values don't match at index %d"


.subsections_via_symbols
