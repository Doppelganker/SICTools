Vhod	START	0
. program

loop	RD	input
	WD	output
	J	loop

. data
input	BYTE	X'00'
output	BYTE	X'01'