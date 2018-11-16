Vhod	START	0
. program
	LDS	#3
	LDT	#len
	LDX	#0

loop	LDA	beseda, X
	SHIFTR	A, 16
	WD	output
	ADDR	S, X
	COMPR	X, T
	JLT	loop

	LDA	newline
	WD	output

end	J	end

. data
output	BYTE	X'AA'
newline	WORD	10
beseda	WORD	C'S'
	WORD	C'I'
	WORD	C'C'
	WORD	C'/'
	WORD	C'X'
	WORD	C'E'
last	EQU	*
len	EQU	last-beseda