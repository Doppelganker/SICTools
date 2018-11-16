poly	START	0
. program
	. horner
	LDA	a
	MUL	x
	ADD	b
	MUL	x
	ADD	c
	MUL	x
	ADD	d
	MUL	x
	ADD	e

	STA	value

end	J	end

. data
x	WORD	42
a	WORD	1
b	WORD	2
c	WORD	3
d	WORD	4
e	WORD	5
. resultat
value	RESW	1