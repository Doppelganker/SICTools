poly	START	0
. program
	LDS	#3
	LDT	#len
	LDX	#0

loop	LDB	x, X	
	JSUB	horner
	STA	value, X
	ADDR	S, X
	COMPR	X, T
	JLT loop

end	J	end

. data
a	WORD	1
b	WORD	2
c	WORD	3
d	WORD	4
e	WORD	5
. starting data
x	WORD	0
	WORD	5
	WORD	42
last 	EQU 	*
. length of the array
len    	EQU 	last-x
. result data
value	RESW	3



. subroutine
horner	LDA	a
	MULR	B, A
	ADD	b
	MULR	B, A
	ADD	c
	MULR	B, A
	ADD	d
	MULR	B, A
	ADD	e
	RSUB