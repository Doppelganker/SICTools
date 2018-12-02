Second		START	0
		JSUB	stackinit
		LDS	#10
		LDA	#0

readloop	RD	readin
		COMP	newline
		JEQ	next
		MULR	S, T
		SUB	numbers
		ADDR	A, T
		RMO	T, A
		COMP	#0
		JEQ	end
		J	readloop


next		RMO	T, A
		JSUB	fib
		RMO	A, T

		. izpis
ost		DIVR	S, T
		MULR	S, T
		SUBR	T, A

		STA	@stackptr
		JSUB	stackpush

		DIVR	S, T
		RMO	T, A

		COMP	#0
		JEQ	izpis
		J	ost

izpis		JSUB   	stackpop
		LDA   	@stackptr
		ADD	numbers
		WD	stdout

		LDA	#stack
		COMP	stackptr
		JEQ	konec
		J	izpis

konec		LDA	newline
		WD	stdout

		LDA	#1
		LDT	#0
		STA	result

		J	readloop

end		J	end

. faktoriela
fact		COMP	#1
		JEQ	factend

		STL	@stackptr
		JSUB	stackpush

		STA	@stackptr
		JSUB	stackpush


		SUB	#1
		JSUB	fact

		JSUB   	stackpop
		LDA   	@stackptr
		MUL	result
		STA	result

		JSUB	stackpop
		LDL	@stackptr

factend		RSUB

. fibonaci
fib		COMP	#0
		JEQ	fibend

		COMP	#1
		JEQ	fibend

		STL	@stackptr
		JSUB	stackpush

		STA	@stackptr
		JSUB	stackpush

		SUB	#1
		JSUB	fib

		RMO	A, T

		JSUB	stackpop
		LDA	@stackptr

		STT	@stackptr
		JSUB	stackpush

		SUB	#2
		JSUB	fib

		JSUB	stackpop
		LDT	@stackptr

		ADDR	T, A
		STA	result

		JSUB	stackpop
		LDL	@stackptr


fibend		RSUB



. stackinit
stackinit 	LDA	#stack
		STA	stackptr
		RSUB

. stackpush
stackpush	STA	stacka
		LDA     stackptr
            	ADD    	#3
            	STA     stackptr
		LDA	stacka
		RSUB

. stackpop
stackpop	STA	stacka
		LDA	stackptr
		SUB	#3
		STA	stackptr
		LDA	stacka
		RSUB

. constant
readin		BYTE	X'FA'
stdout		BYTE	X'01'
newline		WORD	10
numbers		WORD	48
checkA		RESW	1
. result
result		WORD	1
. space for reg. A
stacka		RESW	1
. pointer to stack
stackptr	RESW	1
. start of stack
stack		RESW	100