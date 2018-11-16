Vhod	START	0
. program
	. test echocl
	LDA	char
	JSUB	echocl

	. test echonl
	JSUB	echonl

	. test echostr


	. test echonum
	

end	J	end

. data
output	BYTE	X'01'
newline	WORD	10
char	WORD	C'A'
check	RESW	1

. echocl
echocl	STA	check
	SHIFTR	A, 16
	WD	output
	LDA	check
	RSUB
. echonl
echonl	STA	check
	LDA	newline
	WD	output
	LDA	check
	RSUB
. echostr
echostr STA	check
	. //TODO: napisi kodo
	LDA	check
	RSUB
. echonum
echonum	STA	check
	. //FIXME: napisi vsebino
	LDA	check
	RSUB
