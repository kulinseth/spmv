	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	spmv_coo_wrapper
	.type	spmv_coo_wrapper, @function
spmv_coo_wrapper:
.LFB40:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$16, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$136, %rsp
	.cfi_def_cfa_offset 176
	movl	(%rdi), %eax
	movq	%rsp, %rdx
	leal	1(%rax), %esi
	movq	%rdx, %rdi
	xorl	%eax, %eax
	rep stosq
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L2
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L2:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	16(%rbx), %r12d
	movl	12(%rbx), %r13d
	testl	%r12d, %r12d
	jle	.L3
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L4:
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	pushq	56(%rbx)
	.cfi_def_cfa_offset 192
	movq	40(%rbx), %rdx
	movl	%r13d, %ecx
	movq	32(%rbx), %rsi
	addl	$1, %ebp
	movq	24(%rbx), %rdi
	movq	48(%rbx), %r9
	movl	8(%rbx), %r8d
	call	spmv_coo
	popq	%rax
	.cfi_def_cfa_offset 184
	popq	%rdx
	.cfi_def_cfa_offset 176
	cmpl	%ebp, %r12d
	jne	.L4
.L3:
	xorl	%edi, %edi
	call	pthread_exit
	.cfi_endproc
.LFE40:
	.size	spmv_coo_wrapper, .-spmv_coo_wrapper
	.p2align 4,,15
	.globl	spmv_csr_wrapper
	.type	spmv_csr_wrapper, @function
spmv_csr_wrapper:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$16, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$136, %rsp
	.cfi_def_cfa_offset 176
	movl	(%rdi), %eax
	movq	%rsp, %rdx
	leal	1(%rax), %esi
	movq	%rdx, %rdi
	xorl	%eax, %eax
	rep stosq
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L9
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L9:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	16(%rbx), %r12d
	movl	12(%rbx), %r13d
	testl	%r12d, %r12d
	jle	.L10
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L11:
	movq	40(%rbx), %rdx
	movq	32(%rbx), %rsi
	movl	%r13d, %ecx
	addl	$1, %ebp
	movq	24(%rbx), %rdi
	movq	56(%rbx), %r9
	movq	48(%rbx), %r8
	call	spmv_csr
	cmpl	%ebp, %r12d
	jne	.L11
.L10:
	xorl	%edi, %edi
	call	pthread_exit
	.cfi_endproc
.LFE41:
	.size	spmv_csr_wrapper, .-spmv_csr_wrapper
	.p2align 4,,15
	.globl	spmv_dia_wrapper
	.type	spmv_dia_wrapper, @function
spmv_dia_wrapper:
.LFB42:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$16, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	addq	$-128, %rsp
	.cfi_def_cfa_offset 160
	movl	(%rdi), %eax
	movq	%rsp, %rdx
	leal	1(%rax), %esi
	movq	%rdx, %rdi
	xorl	%eax, %eax
	rep stosq
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L15
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L15:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	28(%rbx), %r12d
	testl	%r12d, %r12d
	jle	.L16
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L17:
	movl	16(%rbx), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	pushq	56(%rbx)
	.cfi_def_cfa_offset 176
	addl	$1, %ebp
	movl	8(%rbx), %ecx
	pushq	48(%rbx)
	.cfi_def_cfa_offset 184
	movl	4(%rbx), %edx
	pushq	%rax
	.cfi_def_cfa_offset 192
	movq	40(%rbx), %rsi
	movq	32(%rbx), %rdi
	movl	20(%rbx), %r9d
	movl	12(%rbx), %r8d
	call	spmv_dia
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	cmpl	%ebp, %r12d
	jne	.L17
.L16:
	xorl	%edi, %edi
	call	pthread_exit
	.cfi_endproc
.LFE42:
	.size	spmv_dia_wrapper, .-spmv_dia_wrapper
	.p2align 4,,15
	.globl	spmv_ell_wrapper
	.type	spmv_ell_wrapper, @function
spmv_ell_wrapper:
.LFB43:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$16, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	addq	$-128, %rsp
	.cfi_def_cfa_offset 160
	movl	(%rdi), %eax
	movq	%rsp, %rdx
	leal	1(%rax), %esi
	movq	%rdx, %rdi
	xorl	%eax, %eax
	rep stosq
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L21
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L21:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	20(%rbx), %r12d
	testl	%r12d, %r12d
	jle	.L22
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L23:
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	pushq	48(%rbx)
	.cfi_def_cfa_offset 168
	addl	$1, %ebp
	movq	32(%rbx), %rsi
	pushq	40(%rbx)
	.cfi_def_cfa_offset 176
	movq	24(%rbx), %rdi
	movl	16(%rbx), %r9d
	movl	12(%rbx), %r8d
	call	spmv_ell
	popq	%rax
	.cfi_def_cfa_offset 168
	popq	%rdx
	.cfi_def_cfa_offset 160
	cmpl	%ebp, %r12d
	jne	.L23
.L22:
	xorl	%edi, %edi
	call	pthread_exit
	.cfi_endproc
.LFE43:
	.size	spmv_ell_wrapper, .-spmv_ell_wrapper
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"create event set error\n"
.LC1:
	.string	"add event error\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"PAPI failed to start counters: %s\n"
	.align 8
.LC3:
	.string	"PAPI failed to read counters: %s\n"
	.text
	.p2align 4,,15
	.globl	spmv_diaii_wrapper
	.type	spmv_diaii_wrapper, @function
spmv_diaii_wrapper:
.LFB44:
	.cfi_startproc
	movabsq	$-9223372026117357568, %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	$pthread_self, %edi
	subq	$176, %rsp
	.cfi_def_cfa_offset 208
	movq	%rax, 4(%rsp)
	movl	$-2147483640, 12(%rsp)
	movl	$-1, (%rsp)
	call	PAPI_thread_init
	testl	%eax, %eax
	jne	.L44
	call	PAPI_thread_id
	addq	$1, %rax
	je	.L44
	call	PAPI_register_thread
	movq	%rsp, %rdi
	call	PAPI_create_eventset
	testl	%eax, %eax
	jne	.L45
	movl	(%rsp), %edi
	movl	$3, %edx
	leaq	4(%rsp), %rsi
	call	PAPI_add_events
	testl	%eax, %eax
	je	.L30
	movl	$.LC1, %edi
	movl	$16, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L30:
	movl	(%rbx), %esi
	leaq	48(%rsp), %rdx
	movl	$32, %ecx
	movq	%rdx, %rdi
	rep stosl
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L31
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L31:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	(%rsp), %edi
	movl	28(%rbx), %r12d
	call	PAPI_start
	movl	%eax, %ebp
	testl	%eax, %eax
	je	.L32
	jmp	.L46
.L33:
	movl	8(%rbx), %ecx
	movl	4(%rbx), %edx
	pushq	%rax
	.cfi_def_cfa_offset 216
	addl	$1, %ebp
	movl	16(%rbx), %eax
	movq	40(%rbx), %rsi
	pushq	56(%rbx)
	.cfi_def_cfa_offset 224
	movq	32(%rbx), %rdi
	pushq	48(%rbx)
	.cfi_def_cfa_offset 232
	movl	20(%rbx), %r9d
	pushq	%rax
	.cfi_def_cfa_offset 240
	movl	12(%rbx), %r8d
	call	spmv_diaii
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
.L32:
	cmpl	%r12d, %ebp
	jl	.L33
	movl	(%rsp), %edi
	leaq	16(%rsp), %rsi
	call	PAPI_read
	testl	%eax, %eax
	je	.L34
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC3, %esi
	movq	%rax, %rdx
.L43:
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf
	.p2align 4,,10
	.p2align 3
.L44:
	movl	$1, %edi
	call	exit
.L45:
	movl	$23, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	jmp	.L44
.L34:
	call	PAPI_unregister_thread
	xorl	%edi, %edi
	call	pthread_exit
.L46:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC2, %esi
	movq	%rax, %rdx
	jmp	.L43
	.cfi_endproc
.LFE44:
	.size	spmv_diaii_wrapper, .-spmv_diaii_wrapper
	.p2align 4,,15
	.globl	spmv_ellii_wrapper
	.type	spmv_ellii_wrapper, @function
spmv_ellii_wrapper:
.LFB45:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$16, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	addq	$-128, %rsp
	.cfi_def_cfa_offset 160
	movl	(%rdi), %eax
	movq	%rsp, %rdx
	leal	1(%rax), %esi
	movq	%rdx, %rdi
	xorl	%eax, %eax
	rep stosq
	movslq	%esi, %rax
	cmpq	$1023, %rax
	ja	.L48
	shrq	$6, %rax
	movl	$1, %edi
	movl	%esi, %ecx
	salq	%cl, %rdi
	orq	%rdi, (%rdx,%rax,8)
.L48:
	movl	$128, %esi
	xorl	%edi, %edi
	call	sched_setaffinity
	movl	20(%rbx), %r12d
	testl	%r12d, %r12d
	jle	.L49
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L50:
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	pushq	48(%rbx)
	.cfi_def_cfa_offset 168
	addl	$1, %ebp
	movq	32(%rbx), %rsi
	pushq	40(%rbx)
	.cfi_def_cfa_offset 176
	movq	24(%rbx), %rdi
	movl	16(%rbx), %r9d
	movl	12(%rbx), %r8d
	call	spmv_ellii
	popq	%rax
	.cfi_def_cfa_offset 168
	popq	%rdx
	.cfi_def_cfa_offset 160
	cmpl	%ebp, %r12d
	jne	.L50
.L49:
	xorl	%edi, %edi
	call	pthread_exit
	.cfi_endproc
.LFE45:
	.size	spmv_ellii_wrapper, .-spmv_ellii_wrapper
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Usage: %s [martix-market-filename] format_num num_workers\n"
	.section	.rodata.str1.1
.LC6:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"PAPI library version mismatch!\n"
	.section	.rodata.str1.1
.LC8:
	.string	"Initialization error!\n"
.LC9:
	.string	"hi add event error\n"
.LC10:
	.string	"%d %s\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Could not process Matrix Market banner.\n"
	.align 8
.LC12:
	.string	"Sorry, this application does not support "
	.section	.rodata.str1.1
.LC13:
	.string	"Market Market type: [%s]\n"
.LC14:
	.string	"%d %d %lf\n"
.LC15:
	.string	"%d %d\n"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"couldn't allocate row using malloc"
	.align 8
.LC17:
	.string	"couldn't allocate col using malloc"
	.align 8
.LC18:
	.string	"couldn't allocate val using malloc"
	.align 8
.LC19:
	.string	"couldn't allocate row_ptr using malloc"
	.align 8
.LC20:
	.string	"couldn't allocate colind using malloc"
	.align 8
.LC21:
	.string	"couldn't allocate x using malloc"
	.align 8
.LC22:
	.string	"couldn't allocate y using calloc"
	.section	.rodata.str1.1
.LC23:
	.string	"bad value : nan\n"
.LC24:
	.string	"bad value : infinite\n"
.LC25:
	.string	"bad value : subnormal\n"
.LC27:
	.string	"struct couldn't be allocated"
.LC28:
	.string	"Error in pthreads!"
.LC31:
	.string	"coo"
.LC32:
	.string	"Num_threads %d\n"
.LC33:
	.string	"Outer %d\n"
.LC34:
	.string	"Inside %d\n"
.LC35:
	.string	"N %d\n"
.LC36:
	.string	"NNZ %d\n"
.LC38:
	.string	"SD %g\n"
.LC39:
	.string	"MFLOPS_S %g\n"
.LC41:
	.string	"Time %g\n"
.LC42:
	.string	"Fletcher_sum y: %d\n"
.LC43:
	.string	"csr"
.LC44:
	.string	"SD %f\n"
.LC45:
	.string	"MFLOPS_s %g\n"
.LC46:
	.string	"Fletcher_sum %d\n"
.LC47:
	.string	"dia"
.LC48:
	.string	"MFLOPS_s %g,"
.LC49:
	.string	"ell"
.LC50:
	.string	"pthread attr init error\n"
.LC51:
	.string	"pthread attr get scope\n"
.LC52:
	.string	"process scope"
.LC53:
	.string	"system scope"
.LC54:
	.string	"%f,"
.LC55:
	.string	"%g,"
.LC56:
	.string	"%d\n"
.LC57:
	.string	"L1 data cache misses is %lld\n"
.LC58:
	.string	"L2 data cache misses is %lld\n"
.LC59:
	.string	"L3 data cache misses is %lld\n"
.LC60:
	.string	"%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	movabsq	$-9223372026117357568, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$15, %ecx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movl	%edi, %r12d
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	movl	$128, %esi
	subq	$552, %rsp
	movq	%rax, -348(%rbp)
	leaq	-176(%rbp), %rax
	movl	$-2147483640, -340(%rbp)
	leaq	8(%rax), %rdx
	xorl	%eax, %eax
	movl	$-1, -404(%rbp)
	movq	%rdx, %rdi
	leaq	-176(%rbp), %rdx
	rep stosq
	xorl	%edi, %edi
	movq	$1, -176(%rbp)
	call	sched_setaffinity
	cmpl	$3, %r12d
	jg	.L54
	movq	(%rbx), %rdx
	movl	$.LC5, %esi
.L242:
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L54:
	movq	8(%rbx), %rdi
	movl	$.LC6, %esi
	call	fopen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L243
	movl	$100663296, %edi
	call	PAPI_library_init
	cmpl	$100663296, %eax
	je	.L56
	testl	%eax, %eax
	jg	.L250
.L56:
	testl	%eax, %eax
	js	.L251
	leaq	-404(%rbp), %rdi
	call	PAPI_create_eventset
	testl	%eax, %eax
	je	.L58
	movl	$.LC0, %edi
	movl	$23, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L250:
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC7, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
.L243:
	movl	$1, %edi
	call	exit
.L251:
	movl	$.LC8, %edi
	movl	$22, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L58:
	movl	-404(%rbp), %edi
	movl	$3, %edx
	leaq	-348(%rbp), %rsi
	call	PAPI_add_events
	movl	%eax, %r13d
	testl	%eax, %eax
	jne	.L252
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	leaq	-396(%rbp), %rsi
	movq	%r12, %rdi
	movq	%rax, -456(%rbp)
	call	mm_read_banner
	testl	%eax, %eax
	jne	.L244
	cmpb	$67, -394(%rbp)
	jne	.L61
	cmpb	$77, -396(%rbp)
	je	.L253
.L61:
	leaq	-420(%rbp), %rcx
	leaq	-424(%rbp), %rdx
	movq	%r12, %rdi
	leaq	-428(%rbp), %rsi
	call	mm_read_mtx_crd_size
	movl	%eax, %r13d
	testl	%eax, %eax
	jne	.L243
	xorl	%r14d, %r14d
	cmpb	$83, -393(%rbp)
	jne	.L63
	jmp	.L254
.L78:
	xorl	%eax, %eax
	movl	$.LC14, %esi
	movq	%r12, %rdi
	leaq	-360(%rbp), %r8
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	call	fscanf
	movsd	-360(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	comisd	%xmm0, %xmm5
	ja	.L75
	pxor	%xmm6, %xmm6
	comisd	%xmm6, %xmm0
	jbe	.L76
.L75:
	addl	$1, %r13d
.L76:
	addl	$1, %r14d
.L63:
	cmpl	%r14d, -420(%rbp)
	jg	.L78
.L71:
	movq	%r12, %rdi
	call	rewind
	leaq	-396(%rbp), %rsi
	movq	%r12, %rdi
	call	mm_read_banner
	testl	%eax, %eax
	jne	.L244
	leaq	-420(%rbp), %rcx
	leaq	-424(%rbp), %rdx
	movq	%r12, %rdi
	leaq	-428(%rbp), %rsi
	call	mm_read_mtx_crd_size
	testl	%eax, %eax
	jne	.L243
	movl	-428(%rbp), %edx
	movl	-424(%rbp), %eax
	cmpl	%eax, %edx
	jle	.L80
	movl	%edx, -424(%rbp)
.L81:
	movslq	%r13d, %r14
	leaq	0(,%r14,4), %r15
	movq	%r15, %rdi
	call	malloc
	movq	%rax, -488(%rbp)
	testq	%rax, %rax
	je	.L255
	movq	%r15, %rdi
	call	malloc
	movq	%rax, -512(%rbp)
	testq	%rax, %rax
	je	.L256
	salq	$3, %r14
	movq	%r14, %rdi
	call	malloc
	movq	%rax, -528(%rbp)
	testq	%rax, %rax
	je	.L245
	movl	-424(%rbp), %eax
	movl	$4, %esi
	leal	1(%rax), %edi
	movslq	%edi, %rdi
	call	calloc
	movq	%rax, -560(%rbp)
	testq	%rax, %rax
	je	.L257
	movq	%r15, %rdi
	call	malloc
	movq	%rax, -552(%rbp)
	testq	%rax, %rax
	je	.L258
	movq	%r14, %rdi
	call	malloc
	movq	%rax, -536(%rbp)
	testq	%rax, %rax
	je	.L245
	movslq	-424(%rbp), %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, -464(%rbp)
	movq	-464(%rbp), %xmm4
	movq	%xmm4, -544(%rbp)
	movq	%xmm4, %rax
	testq	%rax, %rax
	je	.L259
	movq	-544(%rbp), %rsi
	movl	-424(%rbp), %edi
	call	init_arr
	movslq	-424(%rbp), %rdi
	movl	$8, %esi
	call	calloc
	movq	%rax, -480(%rbp)
	testq	%rax, %rax
	je	.L260
	cmpb	$83, -393(%rbp)
	movzbl	-394(%rbp), %eax
	je	.L261
	xorl	%r14d, %r14d
	cmpb	$80, %al
	je	.L109
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	movl	%r13d, -464(%rbp)
	jmp	.L108
.L115:
	addl	$1, %r15d
.L111:
	addl	$1, %r14d
.L108:
	cmpl	%r14d, -420(%rbp)
	jle	.L262
	xorl	%eax, %eax
	movl	$.LC14, %esi
	movq	%r12, %rdi
	leaq	-360(%rbp), %r8
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	call	fscanf
	movsd	-360(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	comisd	%xmm0, %xmm3
	ja	.L110
	pxor	%xmm7, %xmm7
	comisd	%xmm7, %xmm0
	jbe	.L111
.L110:
	movl	-436(%rbp), %ecx
	movslq	%r15d, %rax
	leal	-1(%rcx), %edx
	movq	-488(%rbp), %rcx
	movl	%edx, (%rcx,%rax,4)
	movl	-432(%rbp), %ecx
	leal	-1(%rcx), %edx
	movq	-512(%rbp), %rcx
	movl	%edx, (%rcx,%rax,4)
	movq	-528(%rbp), %rcx
	leaq	(%rcx,%rax,8), %r13
	movsd	%xmm0, 0(%r13)
	call	__fpclassify
	testl	%eax, %eax
	je	.L246
	cmpl	$1, %eax
	je	.L247
	cmpl	$3, %eax
	jne	.L115
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC25, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movq	$0x000000000, 0(%r13)
	jmp	.L115
.L252:
	movl	$19, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	%r13d, %edi
	call	PAPI_strerror
	movq	stderr(%rip), %rdi
	movl	%r13d, %edx
	movl	$.LC10, %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L117:
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$.LC15, %esi
	call	fscanf
	movl	-436(%rbp), %eax
	movq	-488(%rbp), %rcx
	subl	$1, %eax
	movl	%eax, (%rcx,%r14,4)
	movl	-432(%rbp), %eax
	movq	-512(%rbp), %rcx
	subl	$1, %eax
	movl	%eax, (%rcx,%r14,4)
	movq	-528(%rbp), %rax
	movq	.LC26(%rip), %rcx
	movq	%rcx, (%rax,%r14,8)
	addq	$1, %r14
.L109:
	cmpl	%r14d, -420(%rbp)
	jg	.L117
.L107:
	movq	-528(%rbp), %rdx
	movq	-512(%rbp), %rsi
	leal	-1(%r13), %r8d
	xorl	%ecx, %ecx
	movq	-488(%rbp), %rdi
	call	quickSort
	movl	$1, -472(%rbp)
	cmpl	$1000000, %r13d
	jg	.L102
	movl	$500, -472(%rbp)
	cmpl	$100000, %r13d
	jg	.L102
	movl	$1000, -472(%rbp)
	cmpl	$50000, %r13d
	jg	.L102
	movl	$5000, -472(%rbp)
	cmpl	$20000, %r13d
	jg	.L102
	movl	$10000, -472(%rbp)
	cmpl	$5000, %r13d
	jg	.L102
	cmpl	$501, %r13d
	movl	$1000000, %edx
	movl	$100000, %eax
	cmovl	%edx, %eax
	movl	%eax, -472(%rbp)
.L102:
	movq	-456(%rbp), %rcx
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movslq	%ecx, %rax
	movl	%ecx, -464(%rbp)
	leaq	15(,%rax,8), %r14
	shrq	$4, %r14
	salq	$4, %r14
	subq	%r14, %rsp
	movq	%rsp, -496(%rbp)
	call	strtol
	subl	$1, %eax
	jne	.L118
	movl	%r13d, %eax
	movq	%rsp, -552(%rbp)
	subq	%r14, %rsp
	xorl	%r14d, %r14d
	cltd
	movq	%rsp, %r15
	idivl	-464(%rbp)
	movl	%eax, -568(%rbp)
	cltq
	leaq	0(,%rax,4), %rbx
	salq	$3, %rax
	movl	%edx, -576(%rbp)
	movq	%rbx, -536(%rbp)
	movq	-528(%rbp), %rbx
	movq	%rax, -560(%rbp)
	movq	%r12, -528(%rbp)
	movq	%rbx, %r12
	jmp	.L119
.L121:
	movl	$64, %edi
	movl	%ecx, -580(%rbp)
	call	malloc
	movl	-580(%rbp), %ecx
	movq	%rax, (%r15,%r14,8)
	addq	$1, %r14
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L136
	movl	%ecx, (%rax)
	movslq	-424(%rbp), %rdi
	movl	$8, %esi
	movq	-544(%rbp), %rcx
	movl	%r13d, 4(%rax)
	movq	-488(%rbp), %xmm0
	movq	%r12, 40(%rbx)
	movq	%rcx, 48(%rbx)
	movl	%edi, 8(%rbx)
	movhps	-512(%rbp), %xmm0
	movups	%xmm0, 24(%rbx)
	call	calloc
	movl	-568(%rbp), %ecx
	addq	-560(%rbp), %r12
	movq	%rax, 56(%rbx)
	movl	%ecx, 12(%rbx)
	movl	-472(%rbp), %ecx
	movl	%ecx, 16(%rbx)
	movq	-536(%rbp), %rbx
	addq	%rbx, -512(%rbp)
	addq	%rbx, -488(%rbp)
.L119:
	movl	%r14d, %ecx
	cmpl	%r14d, -464(%rbp)
	jg	.L121
	leal	-1(%r14), %eax
	movl	-576(%rbp), %ebx
	movl	-404(%rbp), %edi
	cltq
	movq	-528(%rbp), %r12
	movq	(%r15,%rax,8), %rax
	addl	%ebx, 12(%rax)
	call	PAPI_start
	testl	%eax, %eax
	jne	.L249
	leaq	-304(%rbp), %rbx
	pxor	%xmm3, %xmm3
	leaq	-336(%rbp), %r14
	leaq	24(%rbx), %rax
	movsd	%xmm3, -488(%rbp)
	movq	%rax, -544(%rbp)
	movsd	%xmm3, -512(%rbp)
.L131:
	movq	-480(%rbp), %rsi
	movl	-424(%rbp), %edi
	call	zero_arr
	xorl	%eax, %eax
	movq	%r14, -528(%rbp)
	movq	%rbx, %r14
	movq	%rax, %rbx
	jmp	.L123
.L124:
	movq	(%r15,%rbx,8), %rax
	movl	-424(%rbp), %edi
	addq	$1, %rbx
	movq	56(%rax), %rsi
	call	zero_arr
.L123:
	cmpl	%ebx, -464(%rbp)
	jg	.L124
	movq	%r14, %rbx
	movq	-528(%rbp), %r14
	call	clock
	xorl	%edi, %edi
	movq	%r14, %rsi
	call	clock_gettime
	xorl	%r8d, %r8d
	movq	%r14, -528(%rbp)
	movq	%rbx, %r14
	movq	%r8, %rbx
	jmp	.L125
.L126:
	movq	-496(%rbp), %rax
	movq	(%r15,%rbx,8), %rcx
	movl	$spmv_coo_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%rbx,8), %rdi
	addq	$1, %rbx
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L125:
	cmpl	%ebx, -464(%rbp)
	jg	.L126
	movq	%r14, %rbx
	movq	-528(%rbp), %r14
	xorl	%edx, %edx
	movq	%r14, %r9
	movq	%r12, %r14
	movq	%rbx, %r12
	movq	%rdx, %rbx
.L127:
	cmpl	%ebx, -464(%rbp)
	jle	.L263
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	%r9, -528(%rbp)
	movq	(%rax,%rbx,8), %rdi
	call	pthread_join
	movl	-424(%rbp), %edx
	xorl	%eax, %eax
	movq	-480(%rbp), %rcx
	movq	-528(%rbp), %r9
	jmp	.L128
.L129:
	movq	(%r15,%rbx,8), %rsi
	movsd	(%rcx,%rax,8), %xmm0
	movq	56(%rsi), %rsi
	addsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rcx,%rax,8)
	addq	$1, %rax
.L128:
	cmpl	%eax, %edx
	jg	.L129
	addq	$1, %rbx
	jmp	.L127
.L244:
	movl	$.LC11, %edi
	movl	$40, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L254:
	cmpb	$80, -394(%rbp)
	jne	.L64
	jmp	.L65
.L69:
	addl	$2, %r13d
.L67:
	addl	$1, %r14d
.L64:
	cmpl	%r14d, -420(%rbp)
	jle	.L71
	xorl	%eax, %eax
	movl	$.LC14, %esi
	movq	%r12, %rdi
	leaq	-360(%rbp), %r8
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	call	fscanf
	movsd	-360(%rbp), %xmm0
	pxor	%xmm7, %xmm7
	comisd	%xmm0, %xmm7
	ja	.L66
	pxor	%xmm3, %xmm3
	comisd	%xmm3, %xmm0
	jbe	.L67
.L66:
	movl	-432(%rbp), %eax
	cmpl	%eax, -436(%rbp)
	jne	.L69
	addl	$1, %r13d
	jmp	.L67
.L72:
	addl	$2, %r13d
.L73:
	addl	$1, %r14d
.L65:
	cmpl	%r14d, -420(%rbp)
	jle	.L71
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$.LC15, %esi
	call	fscanf
	movl	-432(%rbp), %eax
	cmpl	%eax, -436(%rbp)
	jne	.L72
	addl	$1, %r13d
	jmp	.L73
.L253:
	cmpb	$67, -395(%rbp)
	jne	.L61
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC12, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	leaq	-396(%rbp), %rdi
	call	mm_typecode_to_str
	movl	$.LC13, %esi
	movq	%rax, %rdx
	jmp	.L242
.L80:
	movl	%eax, -428(%rbp)
	jmp	.L81
.L255:
	movl	$.LC16, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L256:
	movl	$.LC17, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L245:
	movl	$.LC18, %edi
	movl	$34, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L257:
	movl	$.LC19, %edi
	movl	$38, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L258:
	movl	$.LC20, %edi
	movl	$37, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L259:
	movl	$.LC21, %edi
	movl	$32, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L260:
	movl	$.LC22, %edi
	movl	$32, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L118:
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$2, %eax
	je	.L264
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$3, %eax
	je	.L265
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$4, %eax
	je	.L266
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$5, %eax
	je	.L267
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	$6, %eax
	je	.L268
.L133:
	cmpq	%r12, stdin(%rip)
	je	.L191
	movq	%r12, %rdi
	call	fclose
.L191:
	xorl	%edi, %edi
	call	pthread_exit
.L136:
	movl	$.LC27, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L261:
	cmpb	$80, %al
	je	.L269
	movl	$0, -464(%rbp)
	xorl	%r15d, %r15d
	movl	%r13d, -568(%rbp)
	movq	%r12, -472(%rbp)
	movq	%rbx, -576(%rbp)
	jmp	.L91
.L99:
	movl	(%r12), %eax
	movq	-488(%rbp), %rcx
	movsd	-360(%rbp), %xmm0
	movl	%eax, 4(%rcx,%r13)
	movl	(%rbx), %eax
	movq	-512(%rbp), %rbx
	movl	%eax, 4(%rbx,%r13)
	movq	-528(%rbp), %rax
	movq	-496(%rbp), %rbx
	leaq	8(%rax,%rbx), %r14
	movsd	%xmm0, (%r14)
	call	__fpclassify
	cmpl	$3, %eax
	je	.L270
.L100:
	addl	$2, %r15d
.L94:
	addl	$1, -464(%rbp)
.L91:
	movl	-464(%rbp), %eax
	cmpl	%eax, -420(%rbp)
	jle	.L271
	movq	-472(%rbp), %rdi
	xorl	%eax, %eax
	leaq	-360(%rbp), %r8
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	movl	$.LC14, %esi
	call	fscanf
	movsd	-360(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	comisd	%xmm0, %xmm4
	ja	.L93
	comisd	%xmm4, %xmm0
	jbe	.L94
.L93:
	movl	-436(%rbp), %edx
	movslq	%r15d, %rcx
	movq	-488(%rbp), %rax
	leaq	0(,%rcx,4), %r13
	movq	-528(%rbp), %r14
	leaq	(%rax,%r13), %rbx
	leal	-1(%rdx), %eax
	movl	%edx, -580(%rbp)
	movl	%eax, (%rbx)
	movq	-512(%rbp), %rax
	leaq	(%rax,%r13), %r12
	movl	-432(%rbp), %eax
	subl	$1, %eax
	movl	%eax, (%r12)
	leaq	0(,%rcx,8), %rax
	addq	%rax, %r14
	movq	%rax, -496(%rbp)
	movsd	%xmm0, (%r14)
	call	__fpclassify
	movl	-580(%rbp), %edx
	testl	%eax, %eax
	je	.L246
	cmpl	$1, %eax
	je	.L247
	cmpl	$3, %eax
	je	.L272
.L98:
	cmpl	-432(%rbp), %edx
	jne	.L99
	addl	$1, %r15d
	jmp	.L94
.L272:
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC25, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movq	$0x000000000, (%r14)
	movl	-436(%rbp), %edx
	jmp	.L98
.L270:
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC25, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	movq	$0x000000000, (%r14)
	jmp	.L100
.L247:
	movl	$.LC24, %edi
	movl	$21, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L246:
	movl	$.LC23, %edi
	movl	$16, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L262:
	movl	-464(%rbp), %r13d
	jmp	.L107
.L264:
	movq	%rsp, -568(%rbp)
	movl	-424(%rbp), %esi
	movl	%r13d, %edi
	pushq	-536(%rbp)
	movq	-560(%rbp), %rbx
	movq	-528(%rbp), %r8
	pushq	-552(%rbp)
	movq	-512(%rbp), %rcx
	movq	%rbx, %r9
	movq	-488(%rbp), %rdx
	call	coo_csr
	popq	%rax
	movl	-424(%rbp), %eax
	xorl	%ecx, %ecx
	popq	%rdx
	movq	-480(%rbp), %r8
	movq	%r12, -528(%rbp)
	movq	%rbx, %r12
	cltd
	subq	%r14, %rsp
	movq	%rcx, %rbx
	idivl	-464(%rbp)
	movq	%rsp, %r15
	movslq	%eax, %r14
	movl	%edx, -512(%rbp)
	leaq	0(,%r14,4), %rax
	movq	%r14, %rsi
	salq	$3, %r14
	movq	%rax, -488(%rbp)
	movq	%r15, %rax
	movq	%r14, %rcx
	movl	%r13d, %r15d
	movq	%r8, %r13
	movq	%rax, %r8
	jmp	.L135
.L137:
	movl	$64, %edi
	movq	%r8, -576(%rbp)
	movl	%esi, -580(%rbp)
	movq	%rcx, -560(%rbp)
	call	malloc
	movq	-576(%rbp), %r8
	movq	%rax, (%r8,%rbx,8)
	addq	$1, %rbx
	testq	%rax, %rax
	je	.L136
	movq	-552(%rbp), %rcx
	movl	-424(%rbp), %edx
	movl	%r14d, (%rax)
	movl	-580(%rbp), %esi
	movl	%r15d, 4(%rax)
	movq	%rcx, 32(%rax)
	movq	-536(%rbp), %rcx
	movl	%edx, 8(%rax)
	movq	%rcx, 40(%rax)
	movq	-544(%rbp), %rcx
	movl	%esi, 12(%rax)
	movq	%rcx, 48(%rax)
	movl	-472(%rbp), %ecx
	movq	%r12, 24(%rax)
	addq	-488(%rbp), %r12
	movl	%ecx, 16(%rax)
	movq	-560(%rbp), %rcx
	movq	%r13, 56(%rax)
	addq	%rcx, %r13
.L135:
	movl	%ebx, %r14d
	cmpl	%ebx, -464(%rbp)
	jg	.L137
	leal	-1(%rbx), %eax
	movl	-512(%rbp), %ebx
	movl	-404(%rbp), %edi
	movl	%r15d, %r13d
	cltq
	movq	-528(%rbp), %r12
	movq	%r8, %r15
	movq	(%r8,%rax,8), %rax
	addl	%ebx, 12(%rax)
	call	PAPI_start
	testl	%eax, %eax
	jne	.L249
	leaq	-304(%rbp), %rbx
	leaq	-336(%rbp), %r14
	pxor	%xmm4, %xmm4
	leaq	24(%rbx), %rax
	movq	%r14, -552(%rbp)
	movq	%rax, -544(%rbp)
	movsd	%xmm4, -488(%rbp)
	movsd	%xmm4, -512(%rbp)
.L144:
	movq	-480(%rbp), %rsi
	movl	-424(%rbp), %edi
	movq	%rbx, %r14
	call	zero_arr
	call	clock
	movq	-552(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%r8d, %r8d
	movq	%r8, %rbx
	jmp	.L139
.L141:
	movq	-496(%rbp), %rax
	movq	(%r15,%rbx,8), %rcx
	movl	$spmv_csr_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%rbx,8), %rdi
	addq	$1, %rbx
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L139:
	cmpl	%ebx, -464(%rbp)
	jg	.L141
	xorl	%edx, %edx
	movq	%rdx, %rbx
	jmp	.L142
.L143:
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	(%rax,%rbx,8), %rdi
	addq	$1, %rbx
	call	pthread_join
.L142:
	cmpl	%ebx, -464(%rbp)
	jg	.L143
	call	clock
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	movq	%r14, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	pxor	%xmm7, %xmm7
	movsd	.LC29(%rip), %xmm4
	cvtsi2sd	%r13d, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	addq	$8, %rbx
	cvtsi2sd	-472(%rbp), %xmm7
	subq	-328(%rbp), %rax
	mulsd	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movq	-320(%rbp), %rax
	subq	-336(%rbp), %rax
	divsd	.LC30(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm7, -536(%rbp)
	movsd	%xmm4, -528(%rbp)
	mulsd	%xmm7, %xmm4
	addsd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	divsd	%xmm0, %xmm1
	addsd	-512(%rbp), %xmm0
	movsd	%xmm0, -512(%rbp)
	movsd	%xmm1, (%r14)
	cmpq	%rbx, -544(%rbp)
	jne	.L144
	movl	-404(%rbp), %edi
	leaq	-272(%rbp), %rsi
	call	PAPI_read
	testl	%eax, %eax
	jne	.L248
	movl	$.LC43, %edi
	call	puts
	movl	-456(%rbp), %esi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$3, %esi
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
	movl	-472(%rbp), %esi
	movl	$.LC34, %edi
	xorl	%eax, %eax
	call	printf
	movl	-424(%rbp), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	movl	%r13d, %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
	movsd	.LC37(%rip), %xmm3
	movsd	-528(%rbp), %xmm1
	movsd	-488(%rbp), %xmm2
	mulsd	%xmm3, %xmm1
	mulsd	-536(%rbp), %xmm1
	divsd	-512(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC44, %edi
	movl	$1, %eax
	call	printf
	movsd	-456(%rbp), %xmm1
	movl	$.LC45, %edi
	movapd	%xmm1, %xmm0
	jmp	.L240
.L271:
	movl	-568(%rbp), %r13d
	movq	-472(%rbp), %r12
	movq	-576(%rbp), %rbx
	jmp	.L107
.L268:
	movq	-552(%rbp), %r15
	movl	-424(%rbp), %esi
	movq	%rsp, -568(%rbp)
	movl	%r13d, %edi
	pushq	-536(%rbp)
	movq	-560(%rbp), %rbx
	movq	-528(%rbp), %r8
	pushq	%r15
	movq	-512(%rbp), %rcx
	movq	-488(%rbp), %rdx
	movq	%rbx, %r9
	call	coo_csr
	leaq	-408(%rbp), %rax
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-424(%rbp), %r9d
	pushq	%r13
	movl	%r13d, %r15d
	xorl	%ebx, %ebx
	pushq	%rax
	movq	-536(%rbp), %rdx
	leaq	-368(%rbp), %r8
	leaq	-384(%rbp), %rcx
	call	csr_ellii
	movl	-424(%rbp), %edi
	addq	$32, %rsp
	movq	-544(%rbp), %xmm0
	subq	%r14, %rsp
	xorl	%r8d, %r8d
	movq	%r12, -488(%rbp)
	movl	%edi, %eax
	movq	%rsp, %r14
	movhps	-480(%rbp), %xmm0
	movl	%r8d, %r12d
	cltd
	idivl	-464(%rbp)
	movl	%edx, -456(%rbp)
	movl	%eax, %r13d
	jmp	.L182
.L183:
	movl	$56, %edi
	movl	%edx, -528(%rbp)
	movaps	%xmm0, -512(%rbp)
	call	malloc
	movq	%rax, (%r14,%rbx,8)
	movq	%rax, %rcx
	addq	$1, %rbx
	testq	%rax, %rax
	je	.L136
	movl	-408(%rbp), %esi
	movl	-528(%rbp), %edx
	movl	-424(%rbp), %edi
	movdqa	-512(%rbp), %xmm0
	movq	-384(%rbp), %xmm1
	movl	%edx, (%rax)
	movl	%esi, 12(%rax)
	movl	%edi, 16(%rax)
	movl	%r12d, %eax
	movhps	-368(%rbp), %xmm1
	cltd
	movups	%xmm1, 24(%rcx)
	idivl	%esi
	movups	%xmm0, 40(%rcx)
	imull	%r13d, %esi
	addl	%esi, %r12d
	movl	%eax, 4(%rcx)
	addl	%r13d, %eax
	movl	%eax, 8(%rcx)
	movl	-472(%rbp), %eax
	movl	%eax, 20(%rcx)
.L182:
	movl	%ebx, %edx
	cmpl	%ebx, -464(%rbp)
	jg	.L183
	leal	-1(%rbx), %eax
	movl	-456(%rbp), %ebx
	pxor	%xmm7, %xmm7
	movl	%r15d, %r13d
	cltq
	movq	-488(%rbp), %r12
	movsd	%xmm7, -456(%rbp)
	movq	(%r14,%rax,8), %rax
	movsd	%xmm7, -488(%rbp)
	addl	%ebx, 8(%rax)
	leaq	-304(%rbp), %rbx
	leaq	24(%rbx), %rax
	movq	%rax, -512(%rbp)
.L190:
	movq	-480(%rbp), %rsi
	xorl	%r15d, %r15d
	call	zero_arr
	jmp	.L184
.L185:
	leaq	-336(%rbp), %rsi
	xorl	%edi, %edi
	addl	$1, %r15d
	call	clock_gettime
.L184:
	cmpl	-464(%rbp), %r15d
	jl	.L185
	xorl	%r15d, %r15d
	jmp	.L186
.L187:
	movq	-496(%rbp), %rax
	movq	(%r14,%r15,8), %rcx
	movl	$spmv_ellii_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L186:
	cmpl	%r15d, -464(%rbp)
	jg	.L187
	xorl	%r15d, %r15d
	jmp	.L188
.L189:
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_join
.L188:
	cmpl	%r15d, -464(%rbp)
	jg	.L189
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	addq	$8, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	subq	-328(%rbp), %rax
	cvtsi2sd	%r13d, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm1
	mulsd	.LC29(%rip), %xmm0
	pxor	%xmm4, %xmm4
	movq	-320(%rbp), %rax
	subq	-336(%rbp), %rax
	cvtsi2sd	-472(%rbp), %xmm4
	divsd	.LC30(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	mulsd	%xmm4, %xmm2
	divsd	%xmm1, %xmm2
	addsd	-456(%rbp), %xmm1
	movsd	%xmm1, -456(%rbp)
	movsd	%xmm2, -8(%rbx)
	cmpq	-512(%rbp), %rbx
	jne	.L273
	movsd	.LC37(%rip), %xmm3
	movapd	%xmm0, %xmm1
	movsd	-488(%rbp), %xmm2
	mulsd	%xmm3, %xmm1
	mulsd	%xmm4, %xmm1
	divsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC60, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC55, %edi
	movl	$1, %eax
	movsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	printf
	movl	-424(%rbp), %esi
	movq	-480(%rbp), %rdi
	call	fletcher_sum
	movl	$.LC56, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	movq	-568(%rbp), %rsp
	jmp	.L133
.L267:
	movq	-552(%rbp), %r15
	movl	-424(%rbp), %esi
	movq	%rsp, -568(%rbp)
	movl	%r13d, %edi
	pushq	-536(%rbp)
	movq	-560(%rbp), %rbx
	movq	-528(%rbp), %r8
	pushq	%r15
	movq	-512(%rbp), %rcx
	movq	-488(%rbp), %rdx
	movq	%rbx, %r9
	call	coo_csr
	leaq	-412(%rbp), %rax
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-424(%rbp), %r9d
	movl	%r13d, (%rsp)
	leaq	-376(%rbp), %r8
	leaq	-392(%rbp), %rcx
	pushq	%rax
	leaq	-416(%rbp), %rax
	movq	-536(%rbp), %rdx
	pushq	%rax
	call	csr_diaii
	addq	$32, %rsp
	leaq	-240(%rbp), %rdi
	movl	-424(%rbp), %ebx
	subq	%r14, %rsp
	movq	%rsp, %r14
	call	pthread_attr_init
	testl	%eax, %eax
	je	.L167
	movl	$.LC50, %edi
	movl	$24, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L167:
	leaq	-400(%rbp), %rsi
	leaq	-240(%rbp), %rdi
	call	pthread_attr_getscope
	movl	%eax, %r15d
	testl	%eax, %eax
	jne	.L274
	movl	-400(%rbp), %eax
	cmpl	$1, %eax
	je	.L275
	testl	%eax, %eax
	je	.L276
.L170:
	movl	%ebx, %eax
	xorl	%r8d, %r8d
	movq	-544(%rbp), %xmm0
	movq	%r12, -512(%rbp)
	cltd
	movl	%r13d, -488(%rbp)
	movq	%r8, %rbx
	idivl	-464(%rbp)
	movhps	-480(%rbp), %xmm0
	movl	%edx, -456(%rbp)
	movl	%eax, %r12d
	jmp	.L171
.L172:
	movl	$64, %edi
	movaps	%xmm0, -528(%rbp)
	call	malloc
	movq	%rax, (%r14,%rbx,8)
	movq	%rax, %rcx
	addq	$1, %rbx
	testq	%rax, %rax
	je	.L136
	movl	-416(%rbp), %esi
	movl	%r13d, (%rax)
	movq	-392(%rbp), %xmm1
	movdqa	-528(%rbp), %xmm0
	movl	%esi, 12(%rax)
	movl	-424(%rbp), %eax
	movhps	-376(%rbp), %xmm1
	movups	%xmm0, 48(%rcx)
	movl	%eax, 20(%rcx)
	movl	-412(%rbp), %eax
	movups	%xmm1, 32(%rcx)
	movl	%eax, 16(%rcx)
	movl	%r15d, %eax
	cltd
	idivl	%esi
	imull	%r12d, %esi
	addl	%esi, %r15d
	movl	%eax, 4(%rcx)
	leal	-1(%r12,%rax), %eax
	movl	%eax, 8(%rcx)
	movl	-472(%rbp), %eax
	movl	%eax, 28(%rcx)
.L171:
	movl	%ebx, %r13d
	cmpl	%ebx, -464(%rbp)
	jg	.L172
	leal	-1(%rbx), %eax
	movl	-456(%rbp), %ebx
	movl	-404(%rbp), %edi
	cltq
	movl	-488(%rbp), %r13d
	movq	-512(%rbp), %r12
	movq	(%r14,%rax,8), %rax
	addl	%ebx, 8(%rax)
	call	PAPI_start
	testl	%eax, %eax
	jne	.L249
	leaq	-304(%rbp), %rbx
	pxor	%xmm3, %xmm3
	leaq	24(%rbx), %rax
	movsd	%xmm3, -488(%rbp)
	movq	%rax, -512(%rbp)
	movsd	%xmm3, -456(%rbp)
.L180:
	movq	-480(%rbp), %rsi
	movl	-424(%rbp), %edi
	xorl	%r15d, %r15d
	call	zero_arr
	jmp	.L174
.L175:
	leaq	-336(%rbp), %rsi
	xorl	%edi, %edi
	addl	$1, %r15d
	call	clock_gettime
.L174:
	cmpl	-464(%rbp), %r15d
	jl	.L175
	xorl	%r15d, %r15d
	jmp	.L176
.L177:
	movq	-496(%rbp), %rax
	movq	(%r14,%r15,8), %rcx
	movl	$spmv_diaii_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L176:
	cmpl	%r15d, -464(%rbp)
	jg	.L177
	xorl	%r15d, %r15d
	jmp	.L178
.L179:
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_join
.L178:
	cmpl	%r15d, -464(%rbp)
	jg	.L179
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	addq	$8, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	subq	-328(%rbp), %rax
	cvtsi2sd	%r13d, %xmm0
	pxor	%xmm2, %xmm2
	mulsd	.LC29(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movq	-320(%rbp), %rax
	pxor	%xmm4, %xmm4
	subq	-336(%rbp), %rax
	cvtsi2sd	-472(%rbp), %xmm4
	divsd	.LC30(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm2
	movsd	%xmm0, -536(%rbp)
	addsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	movsd	%xmm4, -528(%rbp)
	mulsd	%xmm4, %xmm2
	divsd	%xmm1, %xmm2
	addsd	-456(%rbp), %xmm1
	movsd	%xmm1, -456(%rbp)
	movsd	%xmm2, -8(%rbx)
	cmpq	-512(%rbp), %rbx
	jne	.L180
	movl	-404(%rbp), %edi
	leaq	-272(%rbp), %rsi
	call	PAPI_read
	movsd	-528(%rbp), %xmm4
	movsd	-536(%rbp), %xmm0
	testl	%eax, %eax
	jne	.L248
	movsd	.LC37(%rip), %xmm3
	movapd	%xmm0, %xmm1
	movsd	-488(%rbp), %xmm2
	mulsd	%xmm3, %xmm1
	mulsd	%xmm4, %xmm1
	divsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC54, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC55, %edi
	movl	$1, %eax
	movsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	printf
	movl	-424(%rbp), %esi
	movq	-480(%rbp), %rdi
	call	fletcher_sum
	movl	$.LC56, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	movq	-272(%rbp), %rsi
	movl	$.LC57, %edi
	xorl	%eax, %eax
	call	printf
	movq	-264(%rbp), %rsi
	movl	$.LC58, %edi
	xorl	%eax, %eax
	call	printf
	movq	-256(%rbp), %rsi
	movl	$.LC59, %edi
	xorl	%eax, %eax
	call	printf
	movq	-568(%rbp), %rsp
	jmp	.L133
.L276:
	movl	$.LC53, %edi
	call	puts
	jmp	.L170
.L140:
	movl	$.LC28, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L273:
	movl	-424(%rbp), %edi
	jmp	.L190
.L248:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC3, %esi
	movq	%rax, %rdx
	jmp	.L242
.L275:
	movl	$.LC52, %edi
	call	puts
	jmp	.L170
.L274:
	movl	$.LC51, %edi
	movl	$23, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L266:
	movq	-552(%rbp), %r15
	movl	-424(%rbp), %esi
	movq	%rsp, -568(%rbp)
	movl	%r13d, %edi
	pushq	-536(%rbp)
	movq	-560(%rbp), %rbx
	movq	-528(%rbp), %r8
	pushq	%r15
	movq	-512(%rbp), %rcx
	movq	-488(%rbp), %rdx
	movq	%rbx, %r9
	call	coo_csr
	leaq	-408(%rbp), %rax
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-424(%rbp), %r9d
	pushq	%r13
	movl	%r13d, %r15d
	xorl	%ebx, %ebx
	pushq	%rax
	movq	-536(%rbp), %rdx
	leaq	-368(%rbp), %r8
	leaq	-384(%rbp), %rcx
	call	csr_ell
	movl	-424(%rbp), %edi
	addq	$32, %rsp
	movq	-544(%rbp), %xmm0
	subq	%r14, %rsp
	xorl	%r8d, %r8d
	movq	%r12, -512(%rbp)
	movl	%edi, %eax
	movq	%rsp, %r14
	movhps	-480(%rbp), %xmm0
	movl	%r8d, %r12d
	cltd
	idivl	-464(%rbp)
	movl	%edx, -488(%rbp)
	movl	%eax, %r13d
	jmp	.L157
.L158:
	movl	$56, %edi
	movl	%edx, -536(%rbp)
	movaps	%xmm0, -528(%rbp)
	call	malloc
	movq	%rax, (%r14,%rbx,8)
	movq	%rax, %rcx
	addq	$1, %rbx
	testq	%rax, %rax
	je	.L136
	movl	-408(%rbp), %esi
	movl	-536(%rbp), %edx
	movl	-424(%rbp), %edi
	movdqa	-528(%rbp), %xmm0
	movq	-384(%rbp), %xmm1
	movl	%edx, (%rax)
	movl	%esi, 12(%rax)
	movl	%edi, 16(%rax)
	movl	%r12d, %eax
	movhps	-368(%rbp), %xmm1
	cltd
	movups	%xmm1, 24(%rcx)
	idivl	%esi
	movups	%xmm0, 40(%rcx)
	imull	%r13d, %esi
	addl	%esi, %r12d
	movl	%eax, 4(%rcx)
	addl	%r13d, %eax
	movl	%eax, 8(%rcx)
	movl	-472(%rbp), %eax
	movl	%eax, 20(%rcx)
.L157:
	movl	%ebx, %edx
	cmpl	%ebx, -464(%rbp)
	jg	.L158
	leal	-1(%rbx), %eax
	movl	-488(%rbp), %ebx
	pxor	%xmm4, %xmm4
	movl	%r15d, %r13d
	cltq
	movq	-512(%rbp), %r12
	movsd	%xmm4, -488(%rbp)
	movq	(%r14,%rax,8), %rax
	movsd	%xmm4, -512(%rbp)
	addl	%ebx, 8(%rax)
	leaq	-304(%rbp), %rbx
	leaq	24(%rbx), %rax
	movq	%rax, -528(%rbp)
.L165:
	movq	-480(%rbp), %rsi
	xorl	%r15d, %r15d
	call	zero_arr
	jmp	.L159
.L160:
	leaq	-336(%rbp), %rsi
	xorl	%edi, %edi
	addl	$1, %r15d
	call	clock_gettime
.L159:
	cmpl	-464(%rbp), %r15d
	jl	.L160
	xorl	%r15d, %r15d
	jmp	.L161
.L162:
	movq	-496(%rbp), %rax
	movq	(%r14,%r15,8), %rcx
	movl	$spmv_ell_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L161:
	cmpl	%r15d, -464(%rbp)
	jg	.L162
	xorl	%r15d, %r15d
	jmp	.L163
.L164:
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_join
.L163:
	cmpl	%r15d, -464(%rbp)
	jg	.L164
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	addq	$8, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	subq	-328(%rbp), %rax
	cvtsi2sd	%r13d, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm1
	mulsd	.LC29(%rip), %xmm0
	pxor	%xmm4, %xmm4
	movq	-320(%rbp), %rax
	subq	-336(%rbp), %rax
	cvtsi2sd	-472(%rbp), %xmm4
	divsd	.LC30(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	mulsd	%xmm4, %xmm2
	divsd	%xmm1, %xmm2
	addsd	-512(%rbp), %xmm1
	movsd	%xmm1, -512(%rbp)
	movsd	%xmm2, -8(%rbx)
	cmpq	-528(%rbp), %rbx
	jne	.L277
	movl	$.LC49, %edi
	movsd	%xmm4, -528(%rbp)
	movsd	%xmm0, -464(%rbp)
	call	puts
	movl	-456(%rbp), %esi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$3, %esi
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
	movl	-472(%rbp), %esi
	movl	$.LC34, %edi
	xorl	%eax, %eax
	call	printf
	movl	-424(%rbp), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	movl	%r13d, %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
	movsd	-464(%rbp), %xmm0
	movsd	.LC37(%rip), %xmm3
	movsd	-528(%rbp), %xmm4
	movsd	-488(%rbp), %xmm7
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	mulsd	%xmm4, %xmm1
	divsd	-512(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm7
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	movapd	%xmm7, %xmm2
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC38, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC45, %edi
	movl	$1, %eax
	movsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	printf
	movsd	-512(%rbp), %xmm2
	divsd	.LC40(%rip), %xmm2
	movapd	%xmm2, %xmm0
.L241:
	movl	$.LC41, %edi
	movl	$1, %eax
	call	printf
	movl	-424(%rbp), %esi
	movq	-480(%rbp), %rdi
	call	fletcher_sum
	movl	$.LC46, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	movq	-568(%rbp), %rsp
	jmp	.L133
.L265:
	movq	-552(%rbp), %r15
	movl	-424(%rbp), %esi
	movq	%rsp, -568(%rbp)
	movl	%r13d, %edi
	pushq	-536(%rbp)
	movq	-560(%rbp), %rbx
	movq	-528(%rbp), %r8
	pushq	%r15
	movq	-512(%rbp), %rcx
	movq	-488(%rbp), %rdx
	movq	%rbx, %r9
	call	coo_csr
	leaq	-412(%rbp), %rax
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-424(%rbp), %r9d
	movl	%r13d, (%rsp)
	movl	%r13d, %r15d
	xorl	%ebx, %ebx
	pushq	%rax
	leaq	-416(%rbp), %rax
	movq	-536(%rbp), %rdx
	leaq	-376(%rbp), %r8
	pushq	%rax
	leaq	-392(%rbp), %rcx
	call	csr_dia
	movl	-424(%rbp), %edi
	addq	$32, %rsp
	movq	-544(%rbp), %xmm0
	subq	%r14, %rsp
	xorl	%r8d, %r8d
	movq	%r12, -512(%rbp)
	movl	%edi, %eax
	movq	%rsp, %r14
	movhps	-480(%rbp), %xmm0
	movl	%r8d, %r12d
	cltd
	idivl	-464(%rbp)
	movl	%edx, -488(%rbp)
	movl	%eax, %r13d
	jmp	.L147
.L148:
	movl	$64, %edi
	movl	%edx, -536(%rbp)
	movaps	%xmm0, -528(%rbp)
	call	malloc
	movq	%rax, (%r14,%rbx,8)
	movq	%rax, %rcx
	addq	$1, %rbx
	testq	%rax, %rax
	je	.L136
	movl	-416(%rbp), %esi
	movl	-536(%rbp), %edx
	movl	-424(%rbp), %edi
	movdqa	-528(%rbp), %xmm0
	movq	-392(%rbp), %xmm1
	movl	%edx, (%rax)
	movl	%esi, 12(%rax)
	movl	%edi, 20(%rax)
	movl	-412(%rbp), %eax
	movhps	-376(%rbp), %xmm1
	movups	%xmm1, 32(%rcx)
	movl	%eax, 16(%rcx)
	movl	%r12d, %eax
	cltd
	movups	%xmm0, 48(%rcx)
	idivl	%esi
	imull	%r13d, %esi
	addl	%esi, %r12d
	movl	%eax, 4(%rcx)
	addl	%r13d, %eax
	movl	%eax, 8(%rcx)
	movl	-472(%rbp), %eax
	movl	%eax, 28(%rcx)
.L147:
	movl	%ebx, %edx
	cmpl	%ebx, -464(%rbp)
	jg	.L148
	leal	-1(%rbx), %eax
	movl	-488(%rbp), %ebx
	pxor	%xmm3, %xmm3
	movl	%r15d, %r13d
	cltq
	movq	-512(%rbp), %r12
	movsd	%xmm3, -488(%rbp)
	movq	(%r14,%rax,8), %rax
	movsd	%xmm3, -512(%rbp)
	addl	%ebx, 8(%rax)
	leaq	-304(%rbp), %rbx
	leaq	24(%rbx), %rax
	movq	%rax, -528(%rbp)
.L155:
	movq	-480(%rbp), %rsi
	xorl	%r15d, %r15d
	call	zero_arr
	jmp	.L149
.L150:
	leaq	-336(%rbp), %rsi
	xorl	%edi, %edi
	addl	$1, %r15d
	call	clock_gettime
.L149:
	cmpl	-464(%rbp), %r15d
	jl	.L150
	xorl	%r15d, %r15d
	jmp	.L151
.L152:
	movq	-496(%rbp), %rax
	movq	(%r14,%r15,8), %rcx
	movl	$spmv_dia_wrapper, %edx
	xorl	%esi, %esi
	leaq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_create
	testl	%eax, %eax
	jne	.L140
.L151:
	cmpl	%r15d, -464(%rbp)
	jg	.L152
	xorl	%r15d, %r15d
	jmp	.L153
.L154:
	movq	-496(%rbp), %rax
	xorl	%esi, %esi
	movq	(%rax,%r15,8), %rdi
	addq	$1, %r15
	call	pthread_join
.L153:
	cmpl	%r15d, -464(%rbp)
	jg	.L154
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	addq	$8, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	subq	-328(%rbp), %rax
	cvtsi2sd	%r13d, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm1
	mulsd	.LC29(%rip), %xmm0
	pxor	%xmm4, %xmm4
	movq	-320(%rbp), %rax
	subq	-336(%rbp), %rax
	cvtsi2sd	-472(%rbp), %xmm4
	divsd	.LC30(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	mulsd	%xmm4, %xmm2
	divsd	%xmm1, %xmm2
	addsd	-512(%rbp), %xmm1
	movsd	%xmm1, -512(%rbp)
	movsd	%xmm2, -8(%rbx)
	cmpq	%rbx, -528(%rbp)
	jne	.L278
	movl	$.LC47, %edi
	movsd	%xmm4, -528(%rbp)
	movsd	%xmm0, -464(%rbp)
	call	puts
	movl	-456(%rbp), %esi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$3, %esi
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
	movl	-472(%rbp), %esi
	movl	$.LC34, %edi
	xorl	%eax, %eax
	call	printf
	movl	-424(%rbp), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	movl	%r13d, %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
	movsd	-464(%rbp), %xmm0
	movsd	.LC37(%rip), %xmm3
	movsd	-528(%rbp), %xmm4
	movsd	-488(%rbp), %xmm2
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	mulsd	%xmm4, %xmm1
	divsd	-512(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC44, %edi
	movl	$1, %eax
	call	printf
	movsd	-456(%rbp), %xmm1
	movl	$.LC48, %edi
	movapd	%xmm1, %xmm0
.L240:
	movl	$1, %eax
	call	printf
	movsd	-512(%rbp), %xmm4
	divsd	.LC40(%rip), %xmm4
	movapd	%xmm4, %xmm0
	jmp	.L241
.L277:
	movl	-424(%rbp), %edi
	jmp	.L165
.L278:
	movl	-424(%rbp), %edi
	jmp	.L155
.L249:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC2, %esi
	movq	%rax, %rdx
	jmp	.L242
.L263:
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	movq	%r12, %rbx
	movq	%r14, %r12
	movq	%r9, %r14
	addq	$8, %rbx
	call	clock_gettime
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movsd	.LC29(%rip), %xmm4
	cvtsi2sd	%r13d, %xmm0
	movq	-312(%rbp), %rax
	pxor	%xmm1, %xmm1
	subq	-328(%rbp), %rax
	cvtsi2sd	-472(%rbp), %xmm2
	mulsd	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movq	-320(%rbp), %rax
	subq	-336(%rbp), %rax
	divsd	.LC30(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm2, -536(%rbp)
	movsd	%xmm4, -528(%rbp)
	mulsd	%xmm2, %xmm4
	addsd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	divsd	%xmm0, %xmm1
	addsd	-512(%rbp), %xmm0
	movsd	%xmm0, -512(%rbp)
	movsd	%xmm1, -8(%rbx)
	cmpq	-544(%rbp), %rbx
	jne	.L131
	movl	-404(%rbp), %edi
	leaq	-272(%rbp), %rsi
	call	PAPI_read
	testl	%eax, %eax
	jne	.L248
	movl	$.LC31, %edi
	call	puts
	movl	-456(%rbp), %esi
	movl	$.LC32, %edi
	xorl	%eax, %eax
	call	printf
	movl	$3, %esi
	movl	$.LC33, %edi
	xorl	%eax, %eax
	call	printf
	movl	-472(%rbp), %esi
	movl	$.LC34, %edi
	xorl	%eax, %eax
	call	printf
	movl	-424(%rbp), %esi
	movl	$.LC35, %edi
	xorl	%eax, %eax
	call	printf
	movl	%r13d, %esi
	movl	$.LC36, %edi
	xorl	%eax, %eax
	call	printf
	movsd	.LC37(%rip), %xmm3
	movsd	-528(%rbp), %xmm1
	movsd	-488(%rbp), %xmm2
	mulsd	%xmm3, %xmm1
	mulsd	-536(%rbp), %xmm1
	divsd	-512(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm1, -456(%rbp)
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-296(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	-288(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	call	sqrt
	movl	$.LC38, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC39, %edi
	movl	$1, %eax
	movsd	-456(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	printf
	movl	$.LC41, %edi
	movl	$1, %eax
	movsd	-512(%rbp), %xmm4
	divsd	.LC40(%rip), %xmm4
	movapd	%xmm4, %xmm0
	call	printf
	movl	-424(%rbp), %esi
	movq	-480(%rbp), %rdi
	call	fletcher_sum
	movl	$.LC42, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	movq	-552(%rbp), %rsp
	jmp	.L133
.L269:
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	jmp	.L92
.L104:
	movq	-488(%rbp), %rax
	addl	$2, %r14d
	movl	%esi, 4(%rax,%rdx)
	movl	(%rcx), %eax
	movq	-512(%rbp), %rcx
	movl	%eax, 4(%rcx,%rdx)
	movq	-528(%rbp), %rax
	movq	.LC26(%rip), %rcx
	movq	%rcx, 8(%rax,%r9)
.L105:
	addl	$1, %r15d
.L92:
	cmpl	%r15d, -420(%rbp)
	jle	.L107
	leaq	-432(%rbp), %rcx
	leaq	-436(%rbp), %rdx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$.LC15, %esi
	call	fscanf
	movslq	%r14d, %rax
	movl	-436(%rbp), %r8d
	movq	-488(%rbp), %rcx
	leaq	0(,%rax,4), %rdx
	movl	-432(%rbp), %edi
	movq	-512(%rbp), %r10
	leaq	0(,%rax,8), %r9
	leal	-1(%r8), %esi
	addq	%rdx, %rcx
	movq	-528(%rbp), %r11
	movl	%esi, (%rcx)
	leal	-1(%rdi), %esi
	movl	%esi, (%r10,%rax,4)
	movq	.LC26(%rip), %r10
	movq	%r10, (%r11,%rax,8)
	cmpl	%edi, %r8d
	jne	.L104
	addl	$1, %r14d
	jmp	.L105
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC26:
	.long	0
	.long	1072693248
	.align 8
.LC29:
	.long	2696277389
	.long	1052821239
	.align 8
.LC30:
	.long	0
	.long	1104006501
	.align 8
.LC37:
	.long	0
	.long	1074266112
	.align 8
.LC40:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
