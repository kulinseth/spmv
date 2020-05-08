	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
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
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movq	%rcx, (%rdi)
	movq	%rax, (%rsi)
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
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
                                        ##       Child Loop BB2_20 Depth 3
                                        ##       Child Loop BB2_21 Depth 3
	movl	%r10d, %r8d
	movl	%ecx, %r14d
	cmpl	%r10d, %ecx
	jg	LBB2_16
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
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
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_20 Depth 3
                                        ##       Child Loop BB2_21 Depth 3
	movslq	%r14d, %rsi
	shlq	$2, %rsi
	movl	(%r13,%rsi), %edi
	cmpl	%ebx, %edi
	jge	LBB2_5
	.p2align	4, 0x90
LBB2_20:                                ##   Parent Loop BB2_1 Depth=1
                                        ##     Parent Loop BB2_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	addq	$4, %rsi
	incl	%r14d
	movl	(%r13,%rsi), %edi
	cmpl	%ebx, %edi
	jl	LBB2_20
LBB2_5:                                 ##   in Loop: Header=BB2_3 Depth=2
	jne	LBB2_8
## %bb.6:                               ##   in Loop: Header=BB2_3 Depth=2
	cmpl	%r9d, (%r12,%rsi)
	jl	LBB2_20
## %bb.7:                               ##   in Loop: Header=BB2_3 Depth=2
	movl	%ebx, %edi
LBB2_8:                                 ##   in Loop: Header=BB2_3 Depth=2
	movslq	%r8d, %rdx
	shlq	$2, %rdx
	movl	(%r13,%rdx), %eax
	cmpl	%ebx, %eax
	jle	LBB2_10
	.p2align	4, 0x90
LBB2_21:                                ##   Parent Loop BB2_1 Depth=1
                                        ##     Parent Loop BB2_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	addq	$-4, %rdx
	decl	%r8d
	movl	(%r13,%rdx), %eax
	cmpl	%ebx, %eax
	jg	LBB2_21
LBB2_10:                                ##   in Loop: Header=BB2_3 Depth=2
	jne	LBB2_13
## %bb.11:                              ##   in Loop: Header=BB2_3 Depth=2
	cmpl	%r9d, (%r12,%rdx)
	jg	LBB2_21
## %bb.12:                              ##   in Loop: Header=BB2_3 Depth=2
	movl	%ebx, %eax
LBB2_13:                                ##   in Loop: Header=BB2_3 Depth=2
	cmpl	%r8d, %r14d
	jg	LBB2_15
## %bb.14:                              ##   in Loop: Header=BB2_3 Depth=2
	movl	%eax, (%r13,%rsi)
	movl	%edi, (%r13,%rdx)
	movl	(%r12,%rsi), %eax
	movl	(%r12,%rdx), %edi
	movl	%edi, (%r12,%rsi)
	movl	%eax, (%r12,%rdx)
	movq	(%r15,%rsi,2), %rax
	movq	(%r15,%rdx,2), %rdi
	movq	%rdi, (%r15,%rsi,2)
	movq	%rax, (%r15,%rdx,2)
	incl	%r14d
	decl	%r8d
LBB2_15:                                ##   in Loop: Header=BB2_3 Depth=2
	cmpl	%r8d, %r14d
	jle	LBB2_3
LBB2_16:                                ##   in Loop: Header=BB2_1 Depth=1
	cmpl	%ecx, %r8d
	jle	LBB2_18
## %bb.17:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
                                        ## kill: def $ecx killed $ecx killed $rcx
	movq	%r10, %rbx
	callq	_quickSort
	movq	%rbx, %r10
LBB2_18:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	%r14d, %ecx
	cmpl	%r10d, %r14d
	jl	LBB2_1
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
	.globl	_sort_coo               ## -- Begin function sort_coo
	.p2align	4, 0x90
_sort_coo:                              ## @sort_coo
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
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movl	%esi, %r12d
	movl	%edi, %r13d
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	%r13d, %r9d
	notl	%r9d
	addl	%r12d, %r9d
	testl	%r9d, %r9d
	jle	LBB3_10
## %bb.1:
	movslq	%r13d, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	leal	-1(%r12), %r10d
	xorl	%r11d, %r11d
	.p2align	4, 0x90
LBB3_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_4 Depth 2
	movl	%r11d, %eax
	notl	%eax
	addl	%r12d, %eax
	cmpl	%r13d, %eax
	jle	LBB3_9
## %bb.3:                               ##   in Loop: Header=BB3_2 Depth=1
	movslq	%r10d, %rdi
	movq	-48(%rbp), %rax         ## 8-byte Reload
	.p2align	4, 0x90
LBB3_4:                                 ##   Parent Loop BB3_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%rax, %rcx
	movl	(%rbx,%rax,4), %edx
	movl	4(%rbx,%rax,4), %esi
	incq	%rax
	cmpl	%esi, %edx
	jle	LBB3_5
LBB3_7:                                 ##   in Loop: Header=BB3_4 Depth=2
	movl	%esi, (%rbx,%rcx,4)
	movl	%edx, 4(%rbx,%rcx,4)
	movl	(%r15,%rcx,4), %edx
	movl	4(%r15,%rcx,4), %esi
	movl	%esi, (%r15,%rcx,4)
	movl	%edx, 4(%r15,%rcx,4)
	movdqu	(%r14,%rcx,8), %xmm0
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, (%r14,%rcx,8)
	cmpq	%rax, %rdi
	jne	LBB3_4
	jmp	LBB3_9
	.p2align	4, 0x90
LBB3_5:                                 ##   in Loop: Header=BB3_4 Depth=2
	jne	LBB3_8
## %bb.6:                               ##   in Loop: Header=BB3_4 Depth=2
	movl	(%r15,%rcx,4), %r8d
	cmpl	4(%r15,%rcx,4), %r8d
	jg	LBB3_7
	.p2align	4, 0x90
LBB3_8:                                 ##   in Loop: Header=BB3_4 Depth=2
	cmpq	%rax, %rdi
	jne	LBB3_4
LBB3_9:                                 ##   in Loop: Header=BB3_2 Depth=1
	incl	%r11d
	decl	%r10d
	cmpl	%r9d, %r11d
	jne	LBB3_2
LBB3_10:
	leaq	L_str.6(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_puts                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_init_arr               ## -- Begin function init_arr
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
	jle	LBB4_8
## %bb.1:
	movl	%edi, %edx
	leaq	-1(%rdx), %rcx
	movl	%edx, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB4_3
## %bb.2:
	xorl	%ecx, %ecx
	testq	%rax, %rax
	jne	LBB4_6
	jmp	LBB4_8
LBB4_3:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB4_4:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%ecx, %xmm0
	leal	1(%rcx), %edi
	xorps	%xmm1, %xmm1
	cvtsi2sdl	%edi, %xmm1
	movsd	%xmm0, (%rsi,%rcx,8)
	leal	2(%rcx), %edi
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%edi, %xmm0
	movsd	%xmm1, 8(%rsi,%rcx,8)
	leal	3(%rcx), %edi
	xorps	%xmm1, %xmm1
	cvtsi2sdl	%edi, %xmm1
	movsd	%xmm0, 16(%rsi,%rcx,8)
	movsd	%xmm1, 24(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB4_4
## %bb.5:
	testq	%rax, %rax
	je	LBB4_8
LBB4_6:
	negq	%rax
	.p2align	4, 0x90
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%ecx, %xmm0
	movsd	%xmm0, (%rsi,%rcx,8)
	incq	%rcx
	incq	%rax
	jne	LBB4_7
LBB4_8:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_zero_arr               ## -- Begin function zero_arr
	.p2align	4, 0x90
_zero_arr:                              ## @zero_arr
	.cfi_startproc
## %bb.0:
	testl	%edi, %edi
	jle	LBB5_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	shlq	$3, %rax
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	___bzero
	popq	%rbp
LBB5_2:
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
	leaq	L_.str.2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	testl	%r14d, %r14d
	jle	LBB6_5
## %bb.1:
	movslq	%r14d, %rax
	movl	%r14d, %ebx
	shlq	$3, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	leaq	L_.str.3(%rip), %r14
	.p2align	4, 0x90
LBB6_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_3 Depth 2
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB6_3:                                 ##   Parent Loop BB6_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	(%r12,%r15,8), %xmm0    ## xmm0 = mem[0],zero
	movq	%r14, %rdi
	movb	$1, %al
	callq	_printf
	incq	%r15
	cmpq	%r15, %rbx
	jne	LBB6_3
## %bb.4:                               ##   in Loop: Header=BB6_2 Depth=1
	movl	$10, %edi
	callq	_putchar
	incq	%r13
	addq	-48(%rbp), %r12         ## 8-byte Folded Reload
	cmpq	%r15, %r13
	jne	LBB6_2
LBB6_5:
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
	jle	LBB7_17
## %bb.1:
	movslq	%edi, %r11
	movq	%r11, %rcx
	notq	%rcx
	leaq	1(%r11), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	leal	-1(%rsi), %r12d
	leaq	8(%rdx), %rax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	-48(%rbp), %rax         ## 8-byte Reload
	leaq	8(%rax), %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB7_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB7_11 Depth 2
	movl	%r13d, %eax
	notl	%eax
	addl	%esi, %eax
	movl	%eax, %r9d
	subl	%edi, %r9d
	jle	LBB7_16
## %bb.3:                               ##   in Loop: Header=BB7_2 Depth=1
	movslq	%eax, %r10
	movl	(%rdx,%r11,4), %ebx
	testb	$1, %r9b
	jne	LBB7_5
## %bb.4:                               ##   in Loop: Header=BB7_2 Depth=1
	movq	%r11, %r14
	addq	%rcx, %r10
	jne	LBB7_10
	jmp	LBB7_16
	.p2align	4, 0x90
LBB7_5:                                 ##   in Loop: Header=BB7_2 Depth=1
	movl	4(%rdx,%r11,4), %eax
	cmpl	%eax, %ebx
	jle	LBB7_6
## %bb.7:                               ##   in Loop: Header=BB7_2 Depth=1
	movl	%eax, (%rdx,%r11,4)
	movl	%ebx, 4(%rdx,%r11,4)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movdqu	(%rax,%r11,8), %xmm0
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, (%rax,%r11,8)
	movq	-56(%rbp), %r14         ## 8-byte Reload
	addq	%rcx, %r10
	jne	LBB7_10
	jmp	LBB7_16
LBB7_6:                                 ##   in Loop: Header=BB7_2 Depth=1
	movl	%eax, %ebx
	movq	-56(%rbp), %r14         ## 8-byte Reload
	addq	%rcx, %r10
	je	LBB7_16
LBB7_10:                                ##   in Loop: Header=BB7_2 Depth=1
	movslq	%r12d, %r9
	subq	%r14, %r9
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r14,4), %r10
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r14,8), %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB7_11:                                ##   Parent Loop BB7_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-4(%r10,%r15,4), %eax
	cmpl	%eax, %ebx
	jle	LBB7_12
## %bb.13:                              ##   in Loop: Header=BB7_11 Depth=2
	movl	%eax, -8(%r10,%r15,4)
	movl	%ebx, -4(%r10,%r15,4)
	movdqu	-8(%r14,%r15,8), %xmm0
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, -8(%r14,%r15,8)
	movl	(%r10,%r15,4), %eax
	cmpl	%eax, %ebx
	jg	LBB7_18
LBB7_15:                                ##   in Loop: Header=BB7_11 Depth=2
	movl	%eax, %ebx
	addq	$2, %r15
	cmpq	%r15, %r9
	jne	LBB7_11
	jmp	LBB7_16
	.p2align	4, 0x90
LBB7_12:                                ##   in Loop: Header=BB7_11 Depth=2
	movl	%eax, %ebx
	movl	(%r10,%r15,4), %eax
	cmpl	%eax, %ebx
	jle	LBB7_15
LBB7_18:                                ##   in Loop: Header=BB7_11 Depth=2
	movl	%eax, -4(%r10,%r15,4)
	movl	%ebx, (%r10,%r15,4)
	movdqu	(%r14,%r15,8), %xmm0
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, (%r14,%r15,8)
	addq	$2, %r15
	cmpq	%r15, %r9
	jne	LBB7_11
	.p2align	4, 0x90
LBB7_16:                                ##   in Loop: Header=BB7_2 Depth=1
	incl	%r13d
	decl	%r12d
	cmpl	%r8d, %r13d
	jne	LBB7_2
LBB7_17:
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
	jle	LBB8_5
## %bb.1:
	movq	%rsi, %r14
	movq	%rdi, %r12
	movl	%edx, %r13d
	leaq	L_.str.5(%rip), %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Inner Loop Header: Depth=1
	movsd	(%r12,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	ucomisd	(%r14,%rbx,8), %xmm0
	jne	LBB8_3
	jnp	LBB8_4
LBB8_3:                                 ##   in Loop: Header=BB8_2 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	%r15, %rsi
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	_fprintf
LBB8_4:                                 ##   in Loop: Header=BB8_2 Depth=1
	incq	%rbx
	cmpq	%rbx, %r13
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
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	roundsd	$9, %xmm2, %xmm2
	mulsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function fletcher_sum
LCPI10_0:
	.quad	4643176031446892544     ## double 255
LCPI10_1:
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
	jle	LBB10_1
## %bb.4:
	movl	%esi, %eax
	xorpd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	movsd	LCPI10_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
LBB10_5:                                ## =>This Inner Loop Header: Depth=1
	addsd	(%rdi,%rcx,8), %xmm1
	movapd	%xmm1, %xmm3
	divsd	%xmm2, %xmm3
	roundsd	$9, %xmm3, %xmm3
	mulsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm3
	divsd	%xmm2, %xmm3
	roundsd	$9, %xmm3, %xmm3
	mulsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm0
	incq	%rcx
	cmpq	%rcx, %rax
	jne	LBB10_5
## %bb.2:
	mulsd	LCPI10_1(%rip), %xmm0
	addsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	popq	%rbp
	retq
LBB10_1:
	xorpd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function fletcher_sum_1d_array_int
LCPI11_0:
	.quad	4643176031446892544     ## double 255
LCPI11_1:
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
	jle	LBB11_1
## %bb.4:
	movl	%esi, %eax
	xorpd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	movsd	LCPI11_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
LBB11_5:                                ## =>This Inner Loop Header: Depth=1
	xorps	%xmm3, %xmm3
	cvtsi2sdl	(%rdi,%rcx,4), %xmm3
	addsd	%xmm3, %xmm1
	movapd	%xmm1, %xmm3
	divsd	%xmm2, %xmm3
	roundsd	$9, %xmm3, %xmm3
	mulsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm3
	divsd	%xmm2, %xmm3
	roundsd	$9, %xmm3, %xmm3
	mulsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm0
	incq	%rcx
	cmpq	%rcx, %rax
	jne	LBB11_5
## %bb.2:
	mulsd	LCPI11_1(%rip), %xmm0
	addsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	popq	%rbp
	retq
LBB11_1:
	xorpd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"\n%s\n"

L_.str.3:                               ## @.str.3
	.asciz	"%g\t"

L_.str.5:                               ## @.str.5
	.asciz	"values don't match at index %d"

L_str:                                  ## @str
	.asciz	"sorting started..."

L_str.6:                                ## @str.6
	.asciz	"sorting ended..."


.subsections_via_symbols
