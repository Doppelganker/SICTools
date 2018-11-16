arit	START	0
. program
	. sestevanje
	LDA	x
	ADD	y
	STA	sum
	. odstevanje
	LDA	x
	SUB	y
	STA	diff
	. množenje
	LDA	x
	MUL	y
	STA	prod
	. deljenje
	LDA	x
	DIV	y
	STA	quot
	. ostanek
	LDA	x
test	SUB	y
	COMP	#0
	JGT	test
	JEQ	skip
	ADD	y
skip	STA	mod

end	J	end

. data
x	WORD	7
y	WORD	12
. results
sum	RESW	1
diff	RESW	1
prod	RESW	1
quot	RESW	1
mod	RESW	1