	.file	"utils.c"
	.text
	.p2align 4,,15
	.globl	swap
	.type	swap, @function
swap:
.LFB14:
	.cfi_startproc
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE14:
	.size	swap, .-swap
	.p2align 4,,15
	.globl	swap_val
	.type	swap_val, @function
swap_val:
.LFB15:
	.cfi_startproc
	movsd	(%rdi), %xmm0
	movsd	(%rsi), %xmm1
	movsd	%xmm1, (%rdi)
	movsd	%xmm0, (%rsi)
	ret
	.cfi_endproc
.LFE15:
	.size	swap_val, .-swap_val
	.p2align 4,,15
	.globl	quickSort
	.type	quickSort, @function
quickSort:
.LFB16:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdx, 8(%rsp)
	movl	%r8d, 4(%rsp)
.L15:
	movl	4(%rsp), %ebx
	leal	(%rbx,%r14), %edx
	movl	%ebx, %r8d
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	cltq
	movl	(%r12,%rax,4), %r9d
	movl	0(%rbp,%rax,4), %ecx
	movl	%ebx, %eax
	movl	%r14d, %ebx
	cmpl	%r14d, %eax
	jl	.L12
.L5:
	movslq	%ebx, %rdx
	leaq	(%r12,%rdx,4), %rdi
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	%ecx, 0(%rbp,%rdx,4)
	jge	.L8
.L7:
	addq	$1, %rdx
	addq	$4, %rdi
.L13:
	movl	(%rdi), %r10d
	movl	%edx, %ebx
	leaq	0(,%rdx,4), %r15
	cmpl	%r9d, %r10d
	jl	.L7
	je	.L26
.L8:
	movslq	%r8d, %rax
	leaq	(%r12,%rax,4), %rsi
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L27:
	cmpl	%ecx, 0(%rbp,%rax,4)
	jle	.L11
.L10:
	subq	$1, %rax
	subq	$4, %rsi
.L9:
	movl	(%rsi), %r11d
	movl	%eax, %r8d
	leaq	0(,%rax,4), %r13
	cmpl	%r9d, %r11d
	jg	.L10
	je	.L27
.L11:
	cmpl	%r8d, %ebx
	jle	.L28
.L12:
	cmpl	%r14d, %r8d
	jg	.L29
.L14:
	movl	%ebx, %r14d
	cmpl	4(%rsp), %ebx
	jl	.L15
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
.L28:
	.cfi_restore_state
	addq	%rbp, %r13
	addq	%rbp, %r15
	movl	%r11d, (%rdi)
	addl	$1, %ebx
	movl	%r10d, (%rsi)
	movl	(%r15), %esi
	subl	$1, %r8d
	movl	0(%r13), %edi
	movl	%edi, (%r15)
	movl	%esi, 0(%r13)
	movq	8(%rsp), %rsi
	leaq	(%rsi,%rax,8), %rax
	leaq	(%rsi,%rdx,8), %rdx
	movsd	(%rdx), %xmm0
	movsd	(%rax), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	%xmm0, (%rax)
	cmpl	%r8d, %ebx
	jle	.L5
	cmpl	%r14d, %r8d
	jle	.L14
.L29:
	movq	8(%rsp), %rdx
	movl	%r14d, %ecx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	quickSort
	jmp	.L14
	.cfi_endproc
.LFE16:
	.size	quickSort, .-quickSort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sorting started..."
.LC1:
	.string	"sorting ended..."
	.text
	.p2align 4,,15
	.globl	sort_coo
	.type	sort_coo, @function
sort_coo:
.LFB17:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r12d
	movl	$.LC0, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	puts
	movl	%r14d, %eax
	subl	%r12d, %eax
	cmpl	$1, %eax
	jle	.L31
	movl	%r14d, %esi
	leal	-1(%r14), %r8d
	leaq	4(%r13), %rcx
	movl	%r12d, %r14d
	subl	%eax, %esi
	movslq	%r12d, %rax
	notl	%r14d
	leaq	0(,%rax,4), %r15
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L32:
	cmpl	%r8d, %r12d
	jge	.L38
	leal	(%r14,%r8), %r11d
	addq	8(%rsp), %r11
	movq	%r15, %rax
	movl	%esi, 4(%rsp)
	salq	$2, %r11
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	(%rcx,%rax), %r9
	leaq	0(%r13,%rax), %r10
.L34:
	movl	%edi, (%rbx,%rax)
	movupd	0(%rbp,%rax,2), %xmm0
	movl	%edx, 4(%rbx,%rax)
	movl	(%r10), %edx
	movl	(%r9), %edi
	shufpd	$1, %xmm0, %xmm0
	movl	%edi, (%r10)
	movl	%edx, (%r9)
	movups	%xmm0, 0(%rbp,%rax,2)
.L35:
	addq	$4, %rax
	cmpq	%rax, %r11
	je	.L42
.L36:
	movl	(%rbx,%rax), %edx
	movl	4(%rbx,%rax), %edi
	cmpl	%edi, %edx
	jg	.L43
	jne	.L35
	leaq	(%rax,%r13), %r10
	leaq	(%rcx,%rax), %r9
	movl	4(%r13,%rax), %esi
	cmpl	%esi, 0(%r13,%rax)
	jg	.L34
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	.L36
	.p2align 4,,10
	.p2align 3
.L42:
	movl	4(%rsp), %esi
.L38:
	subl	$1, %r8d
	cmpl	%esi, %r8d
	jne	.L32
.L31:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$.LC1, %edi
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
	jmp	puts
	.cfi_endproc
.LFE17:
	.size	sort_coo, .-sort_coo
	.p2align 4,,15
	.globl	init_arr
	.type	init_arr, @function
init_arr:
.LFB18:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L44
	leal	-1(%rdi), %eax
	cmpl	$2, %eax
	jbe	.L49
	movl	%edi, %edx
	movdqa	.LC2(%rip), %xmm0
	movdqa	.LC3(%rip), %xmm2
	movq	%rsi, %rax
	shrl	$2, %edx
	salq	$5, %rdx
	addq	%rsi, %rdx
	.p2align 4,,10
	.p2align 3
.L47:
	cvtdq2pd	%xmm0, %xmm1
	movups	%xmm1, (%rax)
	pshufd	$238, %xmm0, %xmm1
	addq	$32, %rax
	cvtdq2pd	%xmm1, %xmm1
	movups	%xmm1, -16(%rax)
	paddd	%xmm2, %xmm0
	cmpq	%rdx, %rax
	jne	.L47
	movl	%edi, %eax
	andl	$-4, %eax
	cmpl	%eax, %edi
	je	.L51
.L46:
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, (%rsi,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jle	.L44
	pxor	%xmm0, %xmm0
	movslq	%edx, %rcx
	addl	$2, %eax
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, (%rsi,%rcx,8)
	cmpl	%eax, %edi
	jle	.L44
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, (%rsi,%rdx,8)
.L44:
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	ret
.L49:
	xorl	%eax, %eax
	jmp	.L46
	.cfi_endproc
.LFE18:
	.size	init_arr, .-init_arr
	.p2align 4,,15
	.globl	zero_arr
	.type	zero_arr, @function
zero_arr:
.LFB19:
	.cfi_startproc
	movq	%rsi, %rax
	testl	%edi, %edi
	jle	.L52
	leal	-1(%rdi), %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	leaq	8(,%rdx,8), %rdx
	jmp	memset
	.p2align 4,,10
	.p2align 3
.L52:
	ret
	.cfi_endproc
.LFE19:
	.size	zero_arr, .-zero_arr
	.section	.rodata.str1.1
.LC4:
	.string	"\n%s\n"
.LC5:
	.string	"%g\t"
	.text
	.p2align 4,,15
	.globl	print_arr
	.type	print_arr, @function
print_arr:
.LFB20:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	movl	$.LC4, %edi
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
	jle	.L54
	leal	-1(%r14), %r13d
	movslq	%r14d, %r15
	xorl	%r12d, %r12d
	leaq	8(%rbx,%r13,8), %rbp
	notq	%r13
	salq	$3, %r15
	salq	$3, %r13
	.p2align 4,,10
	.p2align 3
.L56:
	leaq	0(%r13,%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L57:
	movsd	(%rbx), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%rbx, %rbp
	jne	.L57
	movl	$10, %edi
	addl	$1, %r12d
	addq	%r15, %rbp
	call	putchar
	cmpl	%r12d, %r14d
	jne	.L56
.L54:
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
.LFE20:
	.size	print_arr, .-print_arr
	.p2align 4,,15
	.globl	sort
	.type	sort, @function
sort:
.LFB21:
	.cfi_startproc
	movl	%esi, %eax
	subl	%edi, %eax
	cmpl	$1, %eax
	jle	.L60
	leal	-1(%rsi), %r10d
	subl	%eax, %esi
	.p2align 4,,10
	.p2align 3
.L62:
	movslq	%edi, %rax
	cmpl	%edi, %r10d
	jle	.L66
	.p2align 4,,10
	.p2align 3
.L64:
	movl	(%rdx,%rax,4), %r8d
	movl	4(%rdx,%rax,4), %r9d
	cmpl	%r9d, %r8d
	jle	.L63
	movupd	(%rcx,%rax,8), %xmm0
	movl	%r9d, (%rdx,%rax,4)
	movl	%r8d, 4(%rdx,%rax,4)
	shufpd	$1, %xmm0, %xmm0
	movups	%xmm0, (%rcx,%rax,8)
.L63:
	addq	$1, %rax
	cmpl	%eax, %r10d
	jg	.L64
.L66:
	subl	$1, %r10d
	cmpl	%r10d, %esi
	jne	.L62
.L60:
	ret
	.cfi_endproc
.LFE21:
	.size	sort, .-sort
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"values don't match at index %d"
	.text
	.p2align 4,,15
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB22:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L77
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
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L71:
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r13
	je	.L80
.L74:
	movq	%rax, %rbx
.L73:
	movsd	0(%rbp,%rbx,8), %xmm0
	ucomisd	(%r12,%rbx,8), %xmm0
	movl	%ebx, %edx
	jp	.L75
	je	.L71
.L75:
	movq	stderr(%rip), %rdi
	movl	$.LC6, %esi
	xorl	%eax, %eax
	call	fprintf
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r13
	jne	.L74
.L80:
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
.L77:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE22:
	.size	cmp, .-cmp
	.p2align 4,,15
	.globl	matlab_modulo
	.type	matlab_modulo, @function
matlab_modulo:
.LFB23:
	.cfi_startproc
	movapd	%xmm0, %xmm5
	movsd	.LC8(%rip), %xmm4
	movsd	.LC7(%rip), %xmm6
	divsd	%xmm1, %xmm5
	movapd	%xmm5, %xmm3
	movapd	%xmm5, %xmm2
	andpd	%xmm4, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L82
	cvttsd2siq	%xmm5, %rax
	pxor	%xmm3, %xmm3
	movsd	.LC9(%rip), %xmm6
	andnpd	%xmm5, %xmm4
	cvtsi2sdq	%rax, %xmm3
	movapd	%xmm3, %xmm7
	cmpnlesd	%xmm5, %xmm7
	movapd	%xmm7, %xmm2
	andpd	%xmm6, %xmm2
	subsd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	orpd	%xmm4, %xmm2
.L82:
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	matlab_modulo, .-matlab_modulo
	.p2align 4,,15
	.globl	fletcher_sum
	.type	fletcher_sum, @function
fletcher_sum:
.LFB24:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L88
	movsd	.LC9(%rip), %xmm7
	leal	-1(%rsi), %eax
	movsd	.LC11(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movsd	.LC7(%rip), %xmm6
	movsd	.LC8(%rip), %xmm5
	leaq	8(%rdi,%rax,8), %rdx
	pxor	%xmm1, %xmm1
	movapd	%xmm7, %xmm8
	.p2align 4,,10
	.p2align 3
.L87:
	addsd	(%rdi), %xmm1
	movapd	%xmm1, %xmm0
	divsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm3
	movapd	%xmm0, %xmm9
	andpd	%xmm5, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L85
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
	movapd	%xmm3, %xmm10
	cmpnlesd	%xmm0, %xmm10
	movapd	%xmm10, %xmm0
	andpd	%xmm7, %xmm0
	subsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movapd	%xmm5, %xmm3
	andnpd	%xmm9, %xmm3
	orpd	%xmm3, %xmm0
.L85:
	mulsd	%xmm4, %xmm0
	subsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	divsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm3
	movapd	%xmm0, %xmm9
	andpd	%xmm5, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L86
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
	movapd	%xmm3, %xmm11
	cmpnlesd	%xmm0, %xmm11
	movapd	%xmm11, %xmm0
	andpd	%xmm8, %xmm0
	subsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movapd	%xmm5, %xmm3
	andnpd	%xmm9, %xmm3
	orpd	%xmm3, %xmm0
.L86:
	mulsd	%xmm4, %xmm0
	addq	$8, %rdi
	subsd	%xmm0, %xmm2
	cmpq	%rdi, %rdx
	jne	.L87
	mulsd	.LC12(%rip), %xmm2
	addsd	%xmm2, %xmm1
	cvttsd2si	%xmm1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	fletcher_sum, .-fletcher_sum
	.p2align 4,,15
	.globl	fletcher_sum_1d_array_int
	.type	fletcher_sum_1d_array_int, @function
fletcher_sum_1d_array_int:
.LFB25:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L95
	movsd	.LC9(%rip), %xmm7
	leal	-1(%rsi), %eax
	movsd	.LC11(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movsd	.LC7(%rip), %xmm6
	movsd	.LC8(%rip), %xmm5
	leaq	4(%rdi,%rax,4), %rdx
	pxor	%xmm1, %xmm1
	movapd	%xmm7, %xmm8
	.p2align 4,,10
	.p2align 3
.L94:
	pxor	%xmm0, %xmm0
	cvtsi2sd	(%rdi), %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm3
	movapd	%xmm0, %xmm9
	andpd	%xmm5, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L92
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
	movapd	%xmm3, %xmm10
	cmpnlesd	%xmm0, %xmm10
	movapd	%xmm10, %xmm0
	andpd	%xmm7, %xmm0
	subsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movapd	%xmm5, %xmm3
	andnpd	%xmm9, %xmm3
	orpd	%xmm3, %xmm0
.L92:
	mulsd	%xmm4, %xmm0
	subsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	divsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm3
	movapd	%xmm0, %xmm9
	andpd	%xmm5, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L93
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
	movapd	%xmm3, %xmm11
	cmpnlesd	%xmm0, %xmm11
	movapd	%xmm11, %xmm0
	andpd	%xmm8, %xmm0
	subsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	movapd	%xmm5, %xmm3
	andnpd	%xmm9, %xmm3
	orpd	%xmm3, %xmm0
.L93:
	mulsd	%xmm4, %xmm0
	addq	$4, %rdi
	subsd	%xmm0, %xmm2
	cmpq	%rdi, %rdx
	jne	.L94
	mulsd	.LC12(%rip), %xmm2
	addsd	%xmm2, %xmm1
	cvttsd2si	%xmm1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	fletcher_sum_1d_array_int, .-fletcher_sum_1d_array_int
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	0
	.long	1127219200
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	0
	.long	1072693248
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
