arit	START	0
. program
	. nalaganje
	LDA	x
	LDB	y
	. sestevanje
	ADDR	A, T
	ADDR	B, T
	STT	sum
	LDT	#0
	. odstevanje
	ADDR	A, T
	SUBR	B, T
	STT	diff
	LDT	#0
	. množenje
	ADDR	A, T
	MULR	B, T
	STT	prod
	LDT	#0
	. deljenje
	ADDR	A, T
	DIVR	B, T
	STT	quot
	LDT	#0
	. ostanek
	ADDR	A, T
	STS	#0
test	SUBR	B, T
	COMPR	T, S
	JGT	test
	JEQ	skip
	ADDR	B, T
skip	STT	mod

end	J	end

. data
x	WORD	15
y	WORD	4
. results
sum	RESW	1
diff	RESW	1
prod	RESW	1
quot	RESW	1
mod	RESW	1