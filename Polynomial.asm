poly	START	0
. program
	. x^4
	LDA	x
	MUL	x
	MUL	x
	MUL	x
	MUL	a
	ADDR	A, T
	. x^3
	LDA	x
	MUL	x
	MUL	x
	MUL	b
	ADDR	A, T
	. x^2
	LDA	x
	MUL	x
	MUL	c
	ADDR	A, T
	. x^1
	LDA	x
	MUL	d
	ADDR	A, T	
	. x^0
	LDA	e
	ADDR	A, T

	. store value
	STT	value

end	J	end

. data
x	WORD	2
a	WORD	1
b	WORD	2
c	WORD	3
d	WORD	4
e	WORD	5
. resultat
value	RESW	1