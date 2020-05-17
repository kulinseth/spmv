	.file	"utils.c"
	.text
	.p2align 4,,15
	.globl	count_uniq_elems
	.type	count_uniq_elems, @function
count_uniq_elems:
.LFB37:
	.cfi_startproc
	leal	1(%rsi), %r8d
	cmpl	%edi, %r8d
	jge	.L7
	movslq	%r8d, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdx,%r8,4), %r9d
	leal	15(%r9), %esi
	testl	%r9d, %r9d
	cmovns	%r9d, %esi
	sarl	$4, %esi
	movslq	%esi, %rsi
	leaq	(%rcx,%rsi,4), %r9
	movl	(%r9), %esi
	testl	%esi, %esi
	jne	.L4
	addq	$1, %r8
	addl	$1, %eax
	movl	$1, (%r9)
	cmpl	%r8d, %edi
	jg	.L3
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %esi
	addq	$1, %r8
	movl	%esi, (%r9)
	cmpl	%r8d, %edi
	jg	.L3
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	count_uniq_elems, .-count_uniq_elems
	.p2align 4,,15
	.globl	string_compare
	.type	string_compare, @function
string_compare:
.LFB38:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	strlen
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	strlen
	cmpq	%rax, %rbx
	jne	.L15
	testq	%rbx, %rbx
	je	.L14
	call	__ctype_tolower_loc
	movq	(%rax), %rdx
	xorl	%eax, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$1, %rax
	cmpq	%rax, %rbx
	je	.L14
.L12:
	movsbq	0(%rbp,%rax), %rcx
	movsbq	(%r12,%rax), %rdi
	movl	(%rdx,%rcx,4), %esi
	cmpl	%esi, (%rdx,%rdi,4)
	je	.L19
.L15:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$-1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	string_compare, .-string_compare
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Could not process Matrix Market banner.\n"
	.align 8
.LC1:
	.string	"Sorry, this application does not support "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Market Market type: [%s]\n"
.LC3:
	.string	"%d %d %lf\n"
.LC5:
	.string	"%d %d\n"
	.text
	.p2align 4,,15
	.globl	count_nnz
	.type	count_nnz, @function
count_nnz:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	leaq	36(%rsp), %rsi
	call	mm_read_banner
	testl	%eax, %eax
	jne	.L46
	cmpb	$67, 38(%rsp)
	jne	.L22
	cmpb	$77, 36(%rsp)
	je	.L47
.L22:
	leaq	24(%rsp), %rcx
	movq	%r12, %rdi
	leaq	20(%rsp), %rdx
	leaq	16(%rsp), %rsi
	call	mm_read_mtx_crd_size
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L48
	cmpb	$83, 39(%rsp)
	movl	24(%rsp), %eax
	je	.L24
	testl	%eax, %eax
	jle	.L44
	vxorpd	%xmm3, %xmm3, %xmm3
	xorl	%ebx, %ebx
	vmovsd	%xmm3, 8(%rsp)
	leaq	40(%rsp), %r15
	leaq	32(%rsp), %r14
	leaq	28(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L25:
	xorl	%eax, %eax
	movq	%r15, %r8
	movq	%r14, %rcx
	movq	%r13, %rdx
	movl	$.LC3, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	vmovsd	40(%rsp), %xmm0
	vmovsd	8(%rsp), %xmm1
	vcomisd	%xmm0, %xmm1
	ja	.L36
	vcomisd	%xmm1, %xmm0
	jbe	.L37
.L36:
	addl	$1, %ebp
.L37:
	addl	$1, %ebx
	cmpl	%ebx, 24(%rsp)
	jg	.L25
.L44:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	cmpb	$80, 38(%rsp)
	je	.L49
	testl	%eax, %eax
	jle	.L44
	vxorpd	%xmm4, %xmm4, %xmm4
	xorl	%ebx, %ebx
	vmovsd	%xmm4, 8(%rsp)
	leaq	40(%rsp), %r15
	leaq	32(%rsp), %r14
	leaq	28(%rsp), %r13
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L32:
	addl	$2, %ebp
.L30:
	addl	$1, %ebx
	cmpl	%ebx, 24(%rsp)
	jle	.L44
.L33:
	xorl	%eax, %eax
	movq	%r15, %r8
	movq	%r14, %rcx
	movq	%r13, %rdx
	movl	$.LC3, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	vmovsd	40(%rsp), %xmm0
	vmovsd	8(%rsp), %xmm2
	vcomisd	%xmm0, %xmm2
	ja	.L29
	vcomisd	%xmm2, %xmm0
	jbe	.L30
.L29:
	movl	32(%rsp), %eax
	cmpl	%eax, 28(%rsp)
	jne	.L32
	addl	$1, %ebp
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L47:
	cmpb	$67, 37(%rsp)
	jne	.L22
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	leaq	36(%rsp), %rdi
	call	mm_typecode_to_str
	movq	stderr(%rip), %rdi
	movl	$.LC2, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L49:
	leaq	32(%rsp), %r14
	xorl	%ebx, %ebx
	leaq	28(%rsp), %r13
	testl	%eax, %eax
	jg	.L28
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L34:
	addl	$2, %ebp
.L35:
	addl	$1, %ebx
	cmpl	%ebx, 24(%rsp)
	jle	.L44
.L28:
	movq	%r14, %rcx
	movq	%r13, %rdx
	movl	$.LC5, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf
	movl	32(%rsp), %eax
	cmpl	%eax, 28(%rsp)
	jne	.L34
	addl	$1, %ebp
	jmp	.L35
.L48:
	movl	$1, %edi
	call	exit
.L46:
	movl	$.LC0, %edi
	movl	$40, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	count_nnz, .-count_nnz
	.p2align 4,,15
	.globl	swap
	.type	swap, @function
swap:
.LFB40:
	.cfi_startproc
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE40:
	.size	swap, .-swap
	.p2align 4,,15
	.globl	swap_val
	.type	swap_val, @function
swap_val:
.LFB41:
	.cfi_startproc
	vmovss	(%rdi), %xmm0
	vmovss	(%rsi), %xmm1
	vmovss	%xmm1, (%rdi)
	vmovss	%xmm0, (%rsi)
	ret
	.cfi_endproc
.LFE41:
	.size	swap_val, .-swap_val
	.p2align 4,,15
	.globl	quickSort
	.type	quickSort, @function
quickSort:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdx, 8(%rsp)
.L63:
	leal	0(%r13,%rcx), %edx
	movl	%r13d, %r8d
	movl	%ecx, %ebx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	cltq
	movl	(%r12,%rax,4), %edi
	movl	0(%rbp,%rax,4), %r15d
	cmpl	%ecx, %r13d
	jl	.L60
.L53:
	movslq	%ebx, %rax
	leaq	(%r12,%rax,4), %rsi
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L74:
	cmpl	%r15d, 0(%rbp,%rax,4)
	jge	.L56
.L55:
	addq	$1, %rax
	addq	$4, %rsi
.L61:
	movl	(%rsi), %r9d
	leaq	0(,%rax,4), %r11
	movl	%eax, %ebx
	cmpl	%edi, %r9d
	jl	.L55
	je	.L74
.L56:
	movslq	%r8d, %rax
	leaq	(%r12,%rax,4), %rdx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L75:
	cmpl	%r15d, 0(%rbp,%rax,4)
	jle	.L59
.L58:
	subq	$1, %rax
	subq	$4, %rdx
.L57:
	movl	(%rdx), %r10d
	leaq	0(,%rax,4), %r14
	movl	%eax, %r8d
	cmpl	%edi, %r10d
	jg	.L58
	je	.L75
.L59:
	cmpl	%r8d, %ebx
	jle	.L76
.L60:
	cmpl	%r8d, %ecx
	jl	.L77
.L62:
	movl	%ebx, %ecx
	cmpl	%r13d, %ebx
	jl	.L63
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L76:
	.cfi_restore_state
	movl	%r10d, (%rsi)
	leaq	0(%rbp,%r14), %rax
	addl	$1, %ebx
	subl	$1, %r8d
	movl	%r9d, (%rdx)
	leaq	0(%rbp,%r11), %rdx
	movl	(%rax), %r9d
	movl	(%rdx), %esi
	movl	%r9d, (%rdx)
	movl	%esi, (%rax)
	movq	8(%rsp), %rax
	addq	%rax, %r14
	addq	%rax, %r11
	vmovss	(%r11), %xmm0
	vmovss	(%r14), %xmm1
	vmovss	%xmm1, (%r11)
	vmovss	%xmm0, (%r14)
	cmpl	%r8d, %ebx
	jle	.L53
	cmpl	%r8d, %ecx
	jge	.L62
.L77:
	movq	8(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	quickSort
	jmp	.L62
	.cfi_endproc
.LFE42:
	.size	quickSort, .-quickSort
	.p2align 4,,15
	.globl	init_arr
	.type	init_arr, @function
init_arr:
.LFB43:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L86
	leal	-1(%rdi), %eax
	cmpl	$6, %eax
	jbe	.L83
	movl	%edi, %edx
	vmovdqa	.LC6(%rip), %ymm0
	movq	%rsi, %rax
	shrl	$3, %edx
	vmovdqa	.LC7(%rip), %xmm3
	salq	$5, %rdx
	addq	%rsi, %rdx
	.p2align 4,,10
	.p2align 3
.L81:
	vpaddd	%xmm0, %xmm3, %xmm2
	vextractf128	$1, %ymm0, %xmm1
	addq	$32, %rax
	vcvtdq2ps	%ymm0, %ymm0
	vpaddd	%xmm1, %xmm3, %xmm1
	vmovups	%xmm0, -32(%rax)
	vextractf128	$0x1, %ymm0, -16(%rax)
	vinsertf128	$0x1, %xmm1, %ymm2, %ymm0
	cmpq	%rdx, %rax
	jne	.L81
	movl	%edi, %eax
	andl	$-8, %eax
	cmpl	%eax, %edi
	je	.L87
	vzeroupper
.L80:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%eax, %xmm0, %xmm0
	movslq	%eax, %rdx
	vmovss	%xmm0, (%rsi,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edx, %xmm0, %xmm0
	movslq	%edx, %rcx
	leal	2(%rax), %edx
	vmovss	%xmm0, (%rsi,%rcx,4)
	cmpl	%edx, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edx, %xmm0, %xmm0
	movslq	%edx, %rcx
	leal	3(%rax), %edx
	vmovss	%xmm0, (%rsi,%rcx,4)
	cmpl	%edx, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edx, %xmm0, %xmm0
	movslq	%edx, %rcx
	leal	4(%rax), %edx
	vmovss	%xmm0, (%rsi,%rcx,4)
	cmpl	%edx, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edx, %xmm0, %xmm0
	movslq	%edx, %rcx
	leal	5(%rax), %edx
	vmovss	%xmm0, (%rsi,%rcx,4)
	cmpl	%edx, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edx, %xmm0, %xmm0
	movslq	%edx, %rcx
	addl	$6, %eax
	vmovss	%xmm0, (%rsi,%rcx,4)
	cmpl	%eax, %edi
	jle	.L86
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%eax, %xmm0, %xmm0
	movslq	%eax, %rdx
	vmovss	%xmm0, (%rsi,%rdx,4)
.L86:
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	vzeroupper
	ret
.L83:
	xorl	%eax, %eax
	jmp	.L80
	.cfi_endproc
.LFE43:
	.size	init_arr, .-init_arr
	.p2align 4,,15
	.globl	zero_arr
	.type	zero_arr, @function
zero_arr:
.LFB44:
	.cfi_startproc
	movq	%rsi, %rax
	testl	%edi, %edi
	jle	.L90
	leal	-1(%rdi), %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	leaq	4(,%rdx,4), %rdx
	jmp	memset
	.p2align 4,,10
	.p2align 3
.L90:
	ret
	.cfi_endproc
.LFE44:
	.size	zero_arr, .-zero_arr
	.section	.rodata.str1.1
.LC8:
	.string	"\n%s\n"
.LC9:
	.string	"%g\t"
	.text
	.p2align 4,,15
	.globl	print_arr
	.type	print_arr, @function
print_arr:
.LFB45:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	movl	$.LC8, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	printf
	testl	%r14d, %r14d
	jle	.L96
	leal	-1(%r14), %r13d
	movslq	%r14d, %r15
	xorl	%r12d, %r12d
	leaq	8(%rbx,%r13,8), %rbp
	notq	%r13
	salq	$3, %r15
	salq	$3, %r13
	.p2align 4,,10
	.p2align 3
.L93:
	leaq	0(%r13,%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L94:
	vmovsd	(%rbx), %xmm0
	movl	$.LC9, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbx, %rbp
	jne	.L94
	movl	$10, %edi
	addl	$1, %r12d
	addq	%r15, %rbp
	call	putchar
	cmpl	%r12d, %r14d
	jne	.L93
.L96:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	print_arr, .-print_arr
	.p2align 4,,15
	.globl	sort
	.type	sort, @function
sort:
.LFB46:
	.cfi_startproc
	movl	%esi, %eax
	subl	%edi, %eax
	cmpl	$1, %eax
	jle	.L107
	leal	-1(%rsi), %r10d
	subl	%eax, %esi
	.p2align 4,,10
	.p2align 3
.L100:
	movslq	%edi, %rax
	cmpl	%r10d, %edi
	jge	.L104
	.p2align 4,,10
	.p2align 3
.L102:
	movl	(%rdx,%rax,4), %r8d
	movl	4(%rdx,%rax,4), %r9d
	cmpl	%r9d, %r8d
	jle	.L101
	movl	%r8d, 4(%rdx,%rax,4)
	vcvttss2si	(%rcx,%rax,4), %r8d
	vmovss	4(%rcx,%rax,4), %xmm0
	movl	%r9d, (%rdx,%rax,4)
	vmovss	%xmm0, (%rcx,%rax,4)
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%r8d, %xmm0, %xmm0
	vmovss	%xmm0, 4(%rcx,%rax,4)
.L101:
	addq	$1, %rax
	cmpl	%eax, %r10d
	jg	.L102
.L104:
	subl	$1, %r10d
	cmpl	%r10d, %esi
	jne	.L100
.L107:
	ret
	.cfi_endproc
.LFE46:
	.size	sort, .-sort
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"values don't match at index %d"
	.text
	.p2align 4,,15
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB47:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L117
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leal	-1(%rdx), %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L110:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r13
	je	.L120
.L113:
	movq	%rax, %rbx
.L112:
	vmovss	0(%rbp,%rbx,4), %xmm0
	movl	%ebx, %edx
	vucomiss	(%r12,%rbx,4), %xmm0
	jp	.L114
	je	.L110
.L114:
	movq	stderr(%rip), %rdi
	movl	$.LC10, %esi
	xorl	%eax, %eax
	call	fprintf
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r13
	jne	.L113
.L120:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE47:
	.size	cmp, .-cmp
	.p2align 4,,15
	.globl	matlab_modulo
	.type	matlab_modulo, @function
matlab_modulo:
.LFB48:
	.cfi_startproc
	vdivsd	%xmm1, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE48:
	.size	matlab_modulo, .-matlab_modulo
	.p2align 4,,15
	.globl	fletcher_sum
	.type	fletcher_sum, @function
fletcher_sum:
.LFB49:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L125
	leal	-1(%rsi), %eax
	vmovsd	.LC11(%rip), %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	4(%rdi,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L124:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtss2sd	(%rdi), %xmm2, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	addq	$4, %rdi
	vdivsd	%xmm3, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm3, %xmm1, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	cmpq	%rdi, %rax
	jne	.L124
	vmulsd	.LC12(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L125:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE49:
	.size	fletcher_sum, .-fletcher_sum
	.p2align 4,,15
	.globl	fletcher_sum_1d_array_int
	.type	fletcher_sum_1d_array_int, @function
fletcher_sum_1d_array_int:
.LFB50:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L131
	leal	-1(%rsi), %eax
	vmovsd	.LC11(%rip), %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	4(%rdi,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L130:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sd	(%rdi), %xmm2, %xmm2
	addq	$4, %rdi
	vaddsd	%xmm0, %xmm2, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm3, %xmm1, %xmm2
	vroundsd	$9, %xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	cmpq	%rdi, %rax
	jne	.L130
	vmulsd	.LC12(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L131:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE50:
	.size	fletcher_sum_1d_array_int, .-fletcher_sum_1d_array_int
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC6:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	8
	.long	8
	.long	8
	.long	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC11:
	.long	0
	.long	1081073664
	.align 8
.LC12:
	.long	0
	.long	1081081856
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
