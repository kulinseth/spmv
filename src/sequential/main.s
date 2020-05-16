	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	comp_float
	.type	comp_float, @function
comp_float:
.LFB37:
	.cfi_startproc
	vmovss	(%rdi), %xmm0
	vsubss	(%rsi), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	comp_float, .-comp_float
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Usage: %s [martix-market-filename]\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Could not process Matrix Market banner.\n"
	.align 8
.LC4:
	.string	"couldn't allocate row using malloc"
	.align 8
.LC5:
	.string	"couldn't allocate col using malloc"
	.align 8
.LC6:
	.string	"couldn't allocate val using malloc"
	.align 8
.LC7:
	.string	"couldn't allocate row_ptr using malloc"
	.align 8
.LC8:
	.string	"couldn't allocate colind using malloc"
	.align 8
.LC9:
	.string	"couldn't allocate x using malloc"
	.align 8
.LC10:
	.string	"couldn't allocate y using calloc"
	.section	.rodata.str1.1
.LC11:
	.string	"%d %d %lf\n"
.LC12:
	.string	"bad value : nan\n"
.LC13:
	.string	"bad value : infinite\n"
.LC14:
	.string	"bad value : subnormal\n"
.LC16:
	.string	"%d %d\n"
.LC18:
	.string	"\n%s\t%s\t%s\tOuter\t%d\n"
.LC19:
	.string	"%s\t%s\t%s\tInner\t%d\n"
.LC20:
	.string	"%s\t%s\t%s\tN\t%d\n"
.LC21:
	.string	"%s\t%s\t%s\tNNZ\t%d\n"
.LC22:
	.string	"coo"
.LC27:
	.string	"%s\t%s\t%s\tSD\t%g\n"
.LC28:
	.string	"%s\t%s\t%s\tMFLOPS_s\t%g\n"
.LC29:
	.string	"%s\t%s\t%s\tMFLOPS_median\t%g\n"
.LC30:
	.string	"%s\t%s\t%s\tTime\t%g\n"
.LC31:
	.string	"%s\t%s\t%s\tFletcher_sum\t%d\n"
.LC32:
	.string	"csr"
.LC33:
	.string	"%s\t%s\t%s\tSD\t%f\n"
.LC34:
	.string	"dia"
.LC35:
	.string	"ell"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
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
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	cmpl	$1, %edi
	jle	.L89
	movq	8(%rsi), %rdi
	movl	$.LC2, %esi
	call	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L85
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	count_nnz
	movq	%rbx, %rdi
	movl	%eax, 104(%rsp)
	call	rewind
	leaq	189(%rsp), %rsi
	movq	%rbx, %rdi
	call	mm_read_banner
	testl	%eax, %eax
	jne	.L90
	movq	8(%rsp), %rdi
	leaq	172(%rsp), %rcx
	leaq	168(%rsp), %rdx
	leaq	164(%rsp), %rsi
	call	mm_read_mtx_crd_size
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L85
	movl	164(%rsp), %edx
	movl	168(%rsp), %eax
	cmpl	%eax, %edx
	jg	.L91
	movl	%eax, 164(%rsp)
.L9:
	movslq	104(%rsp), %r13
	salq	$2, %r13
	movq	%r13, %rdi
	call	malloc
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L92
	movq	%r13, %rdi
	call	malloc
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L93
	movq	%r13, %rdi
	call	malloc
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L86
	movl	168(%rsp), %eax
	movl	$4, %esi
	leal	1(%rax), %edi
	movslq	%edi, %rdi
	call	calloc
	movq	%rax, 120(%rsp)
	testq	%rax, %rax
	je	.L94
	movq	%r13, %rdi
	call	malloc
	movq	%rax, 80(%rsp)
	testq	%rax, %rax
	je	.L95
	movq	%r13, %rdi
	call	malloc
	movq	%rax, 112(%rsp)
	testq	%rax, %rax
	je	.L86
	movslq	168(%rsp), %rdi
	salq	$2, %rdi
	call	malloc
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L96
	movl	168(%rsp), %edi
	movq	%rax, %rsi
	call	init_arr
	movslq	168(%rsp), %rdi
	movl	$4, %esi
	call	calloc
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	je	.L97
	cmpb	$83, 192(%rsp)
	movzbl	191(%rsp), %edx
	movl	172(%rsp), %eax
	je	.L98
	cmpb	$80, %dl
	je	.L99
	testl	%eax, %eax
	jle	.L23
	leaq	160(%rsp), %rax
	vxorpd	%xmm3, %xmm3, %xmm3
	xorl	%r13d, %r13d
	vmovsd	%xmm3, 16(%rsp)
	movq	%rax, 40(%rsp)
	leaq	156(%rsp), %rax
	leaq	232(%rsp), %r15
	movq	%rax, 32(%rsp)
	movq	%r14, 48(%rsp)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L42:
	addl	$1, %ebx
.L38:
	addl	$1, %r13d
	cmpl	%r13d, 172(%rsp)
	jle	.L100
.L43:
	movq	40(%rsp), %rcx
	xorl	%eax, %eax
	movq	%r15, %r8
	movq	32(%rsp), %rdx
	movl	$.LC11, %esi
	movq	8(%rsp), %rdi
	call	__isoc99_fscanf
	vmovsd	16(%rsp), %xmm6
	vmovsd	232(%rsp), %xmm0
	vcomisd	%xmm0, %xmm6
	ja	.L37
	vcomisd	%xmm6, %xmm0
	jbe	.L38
.L37:
	movl	156(%rsp), %esi
	movslq	%ebx, %rax
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	160(%rsp), %ecx
	leal	-1(%rsi), %edx
	movq	(%rsp), %rsi
	movl	%edx, (%r12,%rax,4)
	leal	-1(%rcx), %edx
	movl	%edx, 0(%rbp,%rax,4)
	leaq	(%rsi,%rax,4), %r14
	vmovss	%xmm0, (%r14)
	call	__fpclassifyf
	testl	%eax, %eax
	je	.L87
	cmpl	$1, %eax
	je	.L88
	cmpl	$3, %eax
	jne	.L42
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC14, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$0x00000000, (%r14)
	jmp	.L42
.L91:
	movl	%edx, 168(%rsp)
	jmp	.L9
.L100:
	movq	48(%rsp), %r14
.L23:
	movl	104(%rsp), %r15d
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	movq	(%rsp), %rdx
	movl	$1, %ebx
	leal	-1(%r15), %r8d
	call	quickSort
	cmpl	$1000000, %r15d
	jg	.L21
	movl	104(%rsp), %eax
	movl	$500, %ebx
	cmpl	$100000, %eax
	jg	.L21
	movl	$1000, %ebx
	cmpl	$50000, %eax
	jle	.L101
	.p2align 4,,10
	.p2align 3
.L21:
	movq	8(%r14), %rdi
	movl	$25971, %r9d
	movl	$1918988371, 193(%rsp)
	movq	16(%r14), %r13
	movb	$0, 199(%rsp)
	movw	%r9w, 197(%rsp)
	call	__xpg_basename
	movl	$3, %r8d
	movl	$.LC18, %edi
	leaq	193(%rsp), %rsi
	movq	%r13, %rcx
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %r13
	call	__xpg_basename
	movl	%ebx, %r8d
	movl	$.LC19, %edi
	leaq	193(%rsp), %rsi
	movq	%r13, %rcx
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	printf
	movq	8(%r14), %rdi
	movl	168(%rsp), %r13d
	movq	16(%r14), %r15
	call	__xpg_basename
	leaq	193(%rsp), %rsi
	movl	$.LC20, %edi
	movl	%r13d, %r8d
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	%r15, %rcx
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %r13
	call	__xpg_basename
	movl	104(%rsp), %r15d
	movl	$.LC21, %edi
	leaq	193(%rsp), %rsi
	movq	%rax, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	movl	%r15d, %r8d
	call	printf
	movq	16(%r14), %rdi
	movl	$.LC22, %esi
	call	string_compare
	testl	%eax, %eax
	jne	.L44
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sd	%r15d, %xmm4, %xmm4
	movq	%r14, 128(%rsp)
	movq	96(%rsp), %r14
	leaq	240(%rsp), %rax
	vmovsd	.LC23(%rip), %xmm5
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 16(%rsp)
	vmovsd	.LC24(%rip), %xmm3
	movq	%rax, %r13
	movq	%rax, 88(%rsp)
	leaq	264(%rsp), %rax
	vmovsd	%xmm2, 32(%rsp)
	movq	%rax, 104(%rsp)
	vmovsd	%xmm4, 72(%rsp)
	vmovsd	%xmm5, 56(%rsp)
	vmovsd	%xmm3, 64(%rsp)
	movq	%r13, 48(%rsp)
.L45:
	movl	168(%rsp), %edi
	movq	%r14, %rsi
	xorl	%r13d, %r13d
	call	zero_arr
	call	clock
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L46:
	subq	$8, %rsp
	.cfi_def_cfa_offset 344
	movq	%r12, %rdi
	movl	%r15d, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 352
	movq	40(%rsp), %r9
	movq	%rbp, %rsi
	addl	$1, %r13d
	movl	184(%rsp), %r8d
	movq	16(%rsp), %rdx
	call	spmv_coo
	popq	%rdi
	.cfi_def_cfa_offset 344
	popq	%r8
	.cfi_def_cfa_offset 336
	cmpl	%r13d, %ebx
	jne	.L46
	call	clock
	cmpq	%rax, 40(%rsp)
	je	.L102
	vmovsd	72(%rsp), %xmm5
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulsd	56(%rsp), %xmm5, %xmm1
	vcvtsi2sd	%ebx, %xmm2, %xmm2
	subq	40(%rsp), %rax
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	64(%rsp), %xmm0, %xmm2
	movq	48(%rsp), %rax
	vaddsd	32(%rsp), %xmm0, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	addq	$8, %rax
	vmovsd	%xmm3, 32(%rsp)
	vmovsd	%xmm1, -8(%rax)
	movq	%rax, 48(%rsp)
	cmpq	%rax, 104(%rsp)
	jne	.L45
.L83:
	vmovsd	72(%rsp), %xmm5
	vxorpd	%xmm0, %xmm0, %xmm0
	vdivsd	64(%rsp), %xmm3, %xmm2
	movl	$comp_float, %ecx
	vmulsd	56(%rsp), %xmm5, %xmm1
	movl	$8, %edx
	movl	$3, %esi
	vmovsd	%xmm2, 48(%rsp)
	vcvtsi2sd	%r13d, %xmm0, %xmm0
	movq	88(%rsp), %rdi
	movq	128(%rsp), %r14
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	.LC25(%rip), %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm4
	vmovsd	%xmm4, 32(%rsp)
	call	qsort
	vmovsd	32(%rsp), %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vmovsd	248(%rsp), %xmm0
	vaddsd	240(%rsp), %xmm0, %xmm0
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	vmovsd	16(%rsp), %xmm1
	vcvtsd2ss	%xmm0, %xmm5, %xmm5
	vmovddup	%xmm4, %xmm0
	vmovss	%xmm5, 40(%rsp)
	vsubpd	240(%rsp), %xmm0, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	256(%rsp), %xmm4, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vdivsd	.LC25(%rip), %xmm0, %xmm0
	call	sqrt
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	vmovsd	%xmm0, 16(%rsp)
	call	__xpg_basename
	vmovsd	16(%rsp), %xmm0
	movl	$.LC27, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	32(%rsp), %xmm0
	movl	$.LC28, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	movl	$.LC29, %edi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	40(%rsp), %xmm0, %xmm0
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	48(%rsp), %xmm2
	vmovapd	%xmm2, %xmm0
.L84:
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$.LC30, %edi
	leaq	193(%rsp), %rsi
	movl	$1, %eax
	call	printf
	movl	164(%rsp), %esi
	movq	96(%rsp), %rdi
	call	fletcher_sum
	movq	8(%r14), %rdi
	movq	16(%r14), %r13
	movl	%eax, %ebx
	call	__xpg_basename
	movl	%ebx, %r8d
	movl	$.LC31, %edi
	leaq	193(%rsp), %rsi
	movq	%rax, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	call	printf
.L50:
	movq	8(%rsp), %rax
	cmpq	%rax, stdin(%rip)
	je	.L62
	movq	%rax, %rdi
	call	fclose
.L62:
	movq	24(%rsp), %rdi
	call	free
	movq	96(%rsp), %rdi
	call	free
	movq	120(%rsp), %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movq	(%rsp), %rdi
	call	free
	movq	80(%rsp), %rdi
	call	free
	movq	112(%rsp), %rdi
	call	free
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L102:
	.cfi_restore_state
	vmovsd	32(%rsp), %xmm5
	vaddsd	16(%rsp), %xmm5, %xmm3
	addq	$8, 48(%rsp)
	movq	48(%rsp), %rax
	vmovsd	%xmm3, 32(%rsp)
	cmpq	%rax, 104(%rsp)
	jne	.L45
	jmp	.L83
.L98:
	cmpb	$80, %dl
	je	.L103
	testl	%eax, %eax
	jle	.L23
	leaq	232(%rsp), %rax
	vxorpd	%xmm2, %xmm2, %xmm2
	xorl	%r13d, %r13d
	vmovsd	%xmm2, 16(%rsp)
	movq	%rax, 88(%rsp)
	leaq	160(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	156(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%r12, 64(%rsp)
	movq	%rbp, 72(%rsp)
	movq	%r14, 128(%rsp)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L30:
	movl	(%r12), %eax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	232(%rsp), %xmm0, %xmm0
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rsi
	movl	%eax, 4(%rcx,%r15)
	movl	0(%rbp), %eax
	movl	%eax, 4(%rsi,%r15)
	movq	(%rsp), %rax
	leaq	4(%rax,%r15), %r14
	vmovss	%xmm0, (%r14)
	call	__fpclassifyf
	cmpl	$3, %eax
	je	.L104
.L31:
	addl	$2, %ebx
.L25:
	addl	$1, %r13d
	cmpl	%r13d, 172(%rsp)
	jle	.L105
.L32:
	movq	88(%rsp), %r8
	xorl	%eax, %eax
	movl	$.LC11, %esi
	movq	40(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rdi
	call	__isoc99_fscanf
	vmovsd	16(%rsp), %xmm7
	vmovsd	232(%rsp), %xmm0
	vcomisd	%xmm0, %xmm7
	ja	.L24
	vcomisd	%xmm7, %xmm0
	jbe	.L25
.L24:
	movl	156(%rsp), %ecx
	movslq	%ebx, %r8
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movq	64(%rsp), %rax
	leaq	0(,%r8,4), %r15
	movl	160(%rsp), %edx
	movl	%ecx, 56(%rsp)
	leaq	(%rax,%r15), %rbp
	leal	-1(%rcx), %eax
	movl	%edx, 48(%rsp)
	movl	%eax, 0(%rbp)
	movq	72(%rsp), %rax
	leaq	(%rax,%r15), %r12
	leal	-1(%rdx), %eax
	movl	%eax, (%r12)
	movq	(%rsp), %rax
	leaq	(%rax,%r15), %r14
	vmovss	%xmm0, (%r14)
	call	__fpclassifyf
	movl	48(%rsp), %edx
	testl	%eax, %eax
	movl	56(%rsp), %ecx
	je	.L87
	cmpl	$1, %eax
	je	.L88
	cmpl	$3, %eax
	je	.L106
.L29:
	cmpl	%edx, %ecx
	jne	.L30
	addl	$1, %ebx
	addl	$1, %r13d
	cmpl	%r13d, 172(%rsp)
	jg	.L32
.L105:
	movq	64(%rsp), %r12
	movq	72(%rsp), %rbp
	movq	128(%rsp), %r14
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L106:
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC14, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$0x00000000, (%r14)
	movl	156(%rsp), %ecx
	movl	160(%rsp), %edx
	jmp	.L29
.L104:
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC14, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$0x00000000, (%r14)
	jmp	.L31
.L44:
	movq	16(%r14), %rdi
	movl	$.LC32, %esi
	call	string_compare
	testl	%eax, %eax
	je	.L107
	movq	16(%r14), %rdi
	movl	$.LC34, %esi
	call	string_compare
	testl	%eax, %eax
	jne	.L55
	pushq	112(%rsp)
	.cfi_def_cfa_offset 344
	movq	%rbp, %rcx
	movq	%r12, %rdx
	pushq	88(%rsp)
	.cfi_def_cfa_offset 352
	movq	136(%rsp), %r15
	movl	120(%rsp), %r13d
	movq	16(%rsp), %r8
	movl	184(%rsp), %esi
	movq	%r15, %r9
	movl	%r13d, %edi
	call	coo_csr
	leaq	196(%rsp), %rax
	movl	%r13d, (%rsp)
	movq	%r15, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 360
	xorl	%r15d, %r15d
	leaq	200(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 368
	movl	200(%rsp), %r9d
	movq	144(%rsp), %rdx
	leaq	248(%rsp), %r8
	movq	112(%rsp), %rsi
	leaq	232(%rsp), %rcx
	call	csr_dia
	vxorpd	%xmm2, %xmm2, %xmm2
	addq	$32, %rsp
	.cfi_def_cfa_offset 336
	vmovsd	.LC23(%rip), %xmm4
	vcvtsi2sd	%r13d, %xmm2, %xmm2
	movq	%r12, 40(%rsp)
	movq	24(%rsp), %r12
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	%rbp, 48(%rsp)
	movq	96(%rsp), %rbp
	leaq	240(%rsp), %rax
	vmovsd	%xmm3, 16(%rsp)
	vmovsd	%xmm3, 32(%rsp)
	vmovsd	%xmm2, 72(%rsp)
	vmovsd	.LC24(%rip), %xmm2
	movq	%rax, 88(%rsp)
	vmovsd	%xmm4, 56(%rsp)
	vmovsd	%xmm2, 64(%rsp)
	movq	%r14, 104(%rsp)
.L58:
	movl	168(%rsp), %edi
	movq	%rbp, %rsi
	xorl	%r14d, %r14d
	call	zero_arr
	call	clock
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L56:
	subq	$8, %rsp
	.cfi_def_cfa_offset 344
	movq	%r12, %r9
	addl	$1, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 352
	movl	196(%rsp), %r8d
	movl	192(%rsp), %ecx
	movl	184(%rsp), %edx
	movq	232(%rsp), %rsi
	movq	216(%rsp), %rdi
	call	spmv_dia
	popq	%rax
	.cfi_def_cfa_offset 344
	popq	%rdx
	.cfi_def_cfa_offset 336
	cmpl	%r14d, %ebx
	jne	.L56
	call	clock
	cmpq	%rax, %r13
	je	.L57
	vmovsd	72(%rsp), %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rax, %rdx
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	subq	%r13, %rdx
	movq	88(%rsp), %rcx
	vmulsd	56(%rsp), %xmm3, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vdivsd	64(%rsp), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r15,8)
.L57:
	subq	%r13, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	addq	$1, %r15
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	32(%rsp), %xmm0, %xmm2
	vmovsd	%xmm2, 32(%rsp)
	cmpq	$3, %r15
	jne	.L58
	vdivsd	64(%rsp), %xmm2, %xmm1
	movl	%r14d, %r13d
	vmovsd	72(%rsp), %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulsd	56(%rsp), %xmm2, %xmm3
	movl	$comp_float, %ecx
	movl	$8, %edx
	vmovsd	%xmm1, 56(%rsp)
	vcvtsi2sd	%r13d, %xmm0, %xmm0
	movq	88(%rsp), %rdi
	movl	$3, %esi
	movq	104(%rsp), %r14
	movq	40(%rsp), %r12
	movq	48(%rsp), %rbp
	vmulsd	%xmm0, %xmm3, %xmm3
	vmulsd	.LC25(%rip), %xmm3, %xmm3
	vdivsd	%xmm1, %xmm3, %xmm3
	vmovsd	%xmm3, 32(%rsp)
	call	qsort
	vmovsd	32(%rsp), %xmm3
	vmovsd	240(%rsp), %xmm5
	vmovsd	248(%rsp), %xmm2
	vsubsd	%xmm5, %xmm3, %xmm0
	vmovsd	%xmm5, 48(%rsp)
	vmovsd	%xmm2, 40(%rsp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	16(%rsp), %xmm0, %xmm4
	vsubsd	%xmm2, %xmm3, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm4
	vsubsd	256(%rsp), %xmm3, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vdivsd	.LC25(%rip), %xmm0, %xmm0
	call	sqrt
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	vmovsd	%xmm0, 16(%rsp)
	call	__xpg_basename
	vmovsd	16(%rsp), %xmm0
	movl	$.LC33, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	32(%rsp), %xmm3
	movl	$.LC28, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	vmovapd	%xmm3, %xmm0
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	40(%rsp), %xmm2
	movl	$.LC29, %edi
	vmovsd	48(%rsp), %xmm5
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	leaq	193(%rsp), %rsi
	vaddsd	%xmm5, %xmm2, %xmm0
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	56(%rsp), %xmm1
	movl	$.LC30, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	vmovapd	%xmm1, %xmm0
	movl	$1, %eax
	call	printf
	movl	164(%rsp), %esi
	movq	96(%rsp), %rdi
	call	fletcher_sum
	movq	8(%r14), %rdi
	movq	16(%r14), %r13
	movl	%eax, %ebx
	call	__xpg_basename
	movl	%ebx, %r8d
	movl	$.LC31, %edi
	leaq	193(%rsp), %rsi
	movq	%rax, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	call	printf
	movq	216(%rsp), %rdi
	call	free
	movq	200(%rsp), %rdi
	call	free
	jmp	.L50
.L99:
	testl	%eax, %eax
	jle	.L23
	movq	(%rsp), %r13
	xorl	%ebx, %ebx
	movq	%r14, 32(%rsp)
	vmovss	.LC17(%rip), %xmm4
	leaq	160(%rsp), %rax
	movq	%rbx, %r14
	leaq	156(%rsp), %r15
	movq	%rax, %rbx
	vmovss	%xmm4, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L36:
	movq	8(%rsp), %rdi
	movq	%rbx, %rcx
	movq	%r15, %rdx
	movl	$.LC16, %esi
	xorl	%eax, %eax
	call	__isoc99_fscanf
	movl	156(%rsp), %eax
	vmovss	16(%rsp), %xmm3
	vmovss	%xmm3, 0(%r13,%r14,4)
	subl	$1, %eax
	movl	%eax, (%r12,%r14,4)
	movl	160(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 0(%rbp,%r14,4)
	addq	$1, %r14
	cmpl	%r14d, 172(%rsp)
	jg	.L36
	movq	32(%rsp), %r14
	jmp	.L23
.L107:
	pushq	112(%rsp)
	.cfi_def_cfa_offset 344
	movq	%rbp, %rcx
	movq	%r12, %rdx
	xorl	%r15d, %r15d
	pushq	88(%rsp)
	.cfi_def_cfa_offset 352
	movl	120(%rsp), %r13d
	movq	136(%rsp), %r9
	movq	16(%rsp), %r8
	movl	184(%rsp), %esi
	movl	%r13d, %edi
	call	coo_csr
	popq	%rcx
	.cfi_def_cfa_offset 344
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	popq	%rsi
	.cfi_def_cfa_offset 336
	vmovsd	.LC24(%rip), %xmm4
	vcvtsi2sd	%r13d, %xmm3, %xmm3
	movq	24(%rsp), %r13
	movq	%r15, 32(%rsp)
	movq	120(%rsp), %r15
	leaq	240(%rsp), %rax
	movq	%rbp, 128(%rsp)
	movq	96(%rsp), %rbp
	movq	%r14, 136(%rsp)
	movq	112(%rsp), %r14
	vmovsd	%xmm3, 72(%rsp)
	vmovsd	.LC23(%rip), %xmm3
	vmovsd	%xmm5, 16(%rsp)
	vmovsd	%xmm5, 48(%rsp)
	movq	%rax, 88(%rsp)
	vmovsd	%xmm3, 56(%rsp)
	vmovsd	%xmm4, 64(%rsp)
	movq	%r12, 104(%rsp)
.L54:
	movl	168(%rsp), %edi
	movq	%rbp, %rsi
	xorl	%r12d, %r12d
	call	zero_arr
	call	clock
	movq	%rax, 40(%rsp)
	movl	%r12d, %eax
	movq	%rbp, %r12
	movl	%eax, %ebp
	.p2align 4,,10
	.p2align 3
.L52:
	movl	168(%rsp), %ecx
	movq	%r12, %r9
	movq	%r13, %r8
	movq	%r14, %rdx
	movq	80(%rsp), %rsi
	movq	%r15, %rdi
	addl	$1, %ebp
	call	spmv_csr
	cmpl	%ebp, %ebx
	jne	.L52
	movl	%ebp, %eax
	movq	%r12, %rbp
	movl	%eax, %r12d
	call	clock
	movq	40(%rsp), %rcx
	cmpq	%rax, %rcx
	je	.L53
	vmovsd	72(%rsp), %xmm5
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rax, %rdx
	vmulsd	56(%rsp), %xmm5, %xmm0
	subq	%rcx, %rdx
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	movq	88(%rsp), %rcx
	vmulsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vdivsd	64(%rsp), %xmm1, %xmm1
	movq	32(%rsp), %rdx
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdx,8)
.L53:
	subq	40(%rsp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	addq	$1, 32(%rsp)
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movq	32(%rsp), %rax
	vaddsd	48(%rsp), %xmm0, %xmm5
	vmovsd	%xmm5, 48(%rsp)
	cmpq	$3, %rax
	jne	.L54
	vmovsd	72(%rsp), %xmm3
	movl	%r12d, %r13d
	vxorpd	%xmm0, %xmm0, %xmm0
	vdivsd	64(%rsp), %xmm5, %xmm1
	vmulsd	56(%rsp), %xmm3, %xmm2
	movl	$comp_float, %ecx
	movl	$8, %edx
	vmovsd	%xmm1, 48(%rsp)
	vcvtsi2sd	%r13d, %xmm0, %xmm0
	movq	88(%rsp), %rdi
	movl	$3, %esi
	movq	136(%rsp), %r14
	movq	128(%rsp), %rbp
	movq	104(%rsp), %r12
	vmulsd	%xmm0, %xmm2, %xmm2
	vmulsd	.LC25(%rip), %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vsubsd	240(%rsp), %xmm2, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	16(%rsp), %xmm0, %xmm3
	vmovsd	%xmm2, 40(%rsp)
	vsubsd	248(%rsp), %xmm2, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm3
	vsubsd	256(%rsp), %xmm2, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rsp)
	call	qsort
	vmovsd	32(%rsp), %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
	vdivsd	.LC25(%rip), %xmm0, %xmm0
	vmovsd	248(%rsp), %xmm3
	vaddsd	240(%rsp), %xmm3, %xmm3
	vmulsd	.LC26(%rip), %xmm3, %xmm3
	vcvtsd2ss	%xmm3, %xmm2, %xmm2
	vmovss	%xmm2, 16(%rsp)
	call	sqrt
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	vmovsd	%xmm0, 32(%rsp)
	call	__xpg_basename
	vmovsd	32(%rsp), %xmm0
	movl	$.LC33, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	40(%rsp), %xmm2
	movl	$.LC28, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	vmovapd	%xmm2, %xmm0
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	movl	$.LC29, %edi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	16(%rsp), %xmm0, %xmm0
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	48(%rsp), %xmm1
	vmovapd	%xmm1, %xmm0
	jmp	.L84
.L101:
	movl	$5000, %ebx
	cmpl	$20000, %eax
	jg	.L21
	movl	$10000, %ebx
	cmpl	$5000, %eax
	jg	.L21
	cmpl	$501, %eax
	movl	$1000000, %ebx
	movl	$100000, %eax
	cmovge	%eax, %ebx
	jmp	.L21
.L103:
	testl	%eax, %eax
	jle	.L23
	movq	(%rsp), %r15
	leaq	160(%rsp), %rax
	xorl	%r13d, %r13d
	vmovss	.LC17(%rip), %xmm4
	movq	%rax, 40(%rsp)
	leaq	156(%rsp), %rax
	movq	%rax, 32(%rsp)
	vmovss	%xmm4, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L20:
	movq	40(%rsp), %rcx
	movl	$.LC16, %esi
	xorl	%eax, %eax
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rdi
	call	__isoc99_fscanf
	movl	156(%rsp), %esi
	movslq	%ebx, %rdx
	leaq	0(,%rdx,4), %rax
	vmovss	16(%rsp), %xmm4
	leaq	(%r12,%rax), %rdi
	vmovss	%xmm4, (%r15,%rdx,4)
	leal	-1(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	160(%rsp), %ecx
	leal	-1(%rcx), %r8d
	movl	%r8d, 0(%rbp,%rdx,4)
	cmpl	%ecx, %esi
	je	.L108
	movl	%r8d, 4(%r12,%rax)
	movl	(%rdi), %edx
	addl	$2, %ebx
	addl	$1, %r13d
	vmovss	16(%rsp), %xmm4
	vmovss	%xmm4, 4(%r15,%rax)
	movl	%edx, 4(%rbp,%rax)
	cmpl	%r13d, 172(%rsp)
	jg	.L20
	jmp	.L23
.L108:
	addl	$1, %ebx
	addl	$1, %r13d
	cmpl	172(%rsp), %r13d
	jl	.L20
	jmp	.L23
.L55:
	movq	16(%r14), %rdi
	movl	$.LC35, %esi
	call	string_compare
	testl	%eax, %eax
	jne	.L50
	pushq	112(%rsp)
	.cfi_def_cfa_offset 344
	movq	%rbp, %rcx
	movq	%r12, %rdx
	pushq	88(%rsp)
	.cfi_def_cfa_offset 352
	movq	136(%rsp), %r15
	movl	120(%rsp), %r13d
	movq	16(%rsp), %r8
	movl	184(%rsp), %esi
	movq	%r15, %r9
	movl	%r13d, %edi
	call	coo_csr
	pushq	%r13
	.cfi_def_cfa_offset 360
	movq	%r15, %rdi
	xorl	%r15d, %r15d
	leaq	208(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 368
	movl	200(%rsp), %r9d
	movq	144(%rsp), %rdx
	leaq	256(%rsp), %r8
	movq	112(%rsp), %rsi
	leaq	240(%rsp), %rcx
	call	csr_ell
	vxorpd	%xmm2, %xmm2, %xmm2
	addq	$32, %rsp
	.cfi_def_cfa_offset 336
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sd	%r13d, %xmm2, %xmm2
	movq	%r12, 40(%rsp)
	movq	24(%rsp), %r12
	movq	%rbp, 48(%rsp)
	movq	96(%rsp), %rbp
	leaq	240(%rsp), %rax
	vmovsd	%xmm3, 16(%rsp)
	vmovsd	%xmm3, 32(%rsp)
	vmovsd	%xmm2, 72(%rsp)
	vmovsd	.LC23(%rip), %xmm2
	movq	%rax, 88(%rsp)
	vmovsd	%xmm2, 56(%rsp)
	vmovsd	.LC24(%rip), %xmm2
	movq	%r14, 104(%rsp)
	vmovsd	%xmm2, 64(%rsp)
.L61:
	movl	168(%rsp), %edi
	movq	%rbp, %rsi
	xorl	%r14d, %r14d
	call	zero_arr
	call	clock
	movq	%rax, %r13
.L59:
	movl	184(%rsp), %ecx
	movq	%rbp, %r9
	movq	%r12, %r8
	addl	$1, %r14d
	movl	168(%rsp), %edx
	movq	224(%rsp), %rsi
	movq	208(%rsp), %rdi
	call	spmv_ell
	cmpl	%r14d, %ebx
	jne	.L59
	call	clock
	cmpq	%rax, %r13
	je	.L60
	vmovsd	72(%rsp), %xmm5
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rax, %rdx
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	subq	%r13, %rdx
	movq	88(%rsp), %rcx
	vmulsd	56(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vdivsd	64(%rsp), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r15,8)
.L60:
	subq	%r13, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	addq	$1, %r15
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	32(%rsp), %xmm0, %xmm3
	vmovsd	%xmm3, 32(%rsp)
	cmpq	$3, %r15
	jne	.L61
	vdivsd	64(%rsp), %xmm3, %xmm2
	movl	%r14d, %r13d
	vmovsd	72(%rsp), %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	vmulsd	56(%rsp), %xmm3, %xmm1
	movl	$comp_float, %ecx
	movl	$8, %edx
	vmovsd	%xmm2, 56(%rsp)
	vcvtsi2sd	%r13d, %xmm0, %xmm0
	movq	88(%rsp), %rdi
	movl	$3, %esi
	movq	104(%rsp), %r14
	movq	40(%rsp), %r12
	movq	48(%rsp), %rbp
	vmulsd	%xmm0, %xmm1, %xmm1
	vmulsd	.LC25(%rip), %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	call	qsort
	vmovsd	32(%rsp), %xmm1
	vmovsd	240(%rsp), %xmm5
	vmovsd	248(%rsp), %xmm3
	vsubsd	%xmm5, %xmm1, %xmm0
	vmovsd	%xmm5, 48(%rsp)
	vmovsd	%xmm3, 40(%rsp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	16(%rsp), %xmm0, %xmm4
	vsubsd	%xmm3, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm4
	vsubsd	256(%rsp), %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vdivsd	.LC25(%rip), %xmm0, %xmm0
	call	sqrt
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	vmovsd	%xmm0, 16(%rsp)
	call	__xpg_basename
	vmovsd	16(%rsp), %xmm0
	movl	$.LC33, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	32(%rsp), %xmm1
	movl	$.LC28, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	vmovapd	%xmm1, %xmm0
	movl	$1, %eax
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	40(%rsp), %xmm3
	movl	$.LC29, %edi
	vmovsd	48(%rsp), %xmm5
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$1, %eax
	leaq	193(%rsp), %rsi
	vaddsd	%xmm5, %xmm3, %xmm0
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	printf
	movq	8(%r14), %rdi
	movq	16(%r14), %rbx
	call	__xpg_basename
	vmovsd	56(%rsp), %xmm2
	movl	$.LC30, %edi
	leaq	193(%rsp), %rsi
	movq	%rbx, %rcx
	movq	%rax, %rdx
	vmovapd	%xmm2, %xmm0
	movl	$1, %eax
	call	printf
	movl	164(%rsp), %esi
	movq	96(%rsp), %rdi
	call	fletcher_sum
	movq	8(%r14), %rdi
	movq	16(%r14), %r13
	movl	%eax, %ebx
	call	__xpg_basename
	movl	%ebx, %r8d
	movl	$.LC31, %edi
	leaq	193(%rsp), %rsi
	movq	%rax, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	call	printf
	movq	224(%rsp), %rdi
	call	free
	movq	208(%rsp), %rdi
	call	free
	jmp	.L50
.L88:
	movl	$.LC13, %edi
	movl	$21, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L87:
	movl	$.LC12, %edi
	movl	$16, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L90:
	movl	$40, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
.L85:
	movl	$1, %edi
	call	exit
.L93:
	movl	$.LC5, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L86:
	movl	$.LC6, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L94:
	movl	$.LC7, %edi
	movl	$38, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L95:
	movl	$.LC8, %edi
	movl	$37, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L89:
	movq	(%rsi), %rdx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movq	stderr(%rip), %rdi
	call	fprintf
	movl	$1, %edi
	call	exit
.L92:
	movl	$.LC4, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L96:
	movl	$.LC9, %edi
	movl	$32, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L97:
	movl	$.LC10, %edi
	movl	$32, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC17:
	.long	1065353216
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	2696277389
	.long	1052821239
	.align 8
.LC24:
	.long	0
	.long	1093567616
	.align 8
.LC25:
	.long	0
	.long	1074266112
	.align 8
.LC26:
	.long	0
	.long	1071644672
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
