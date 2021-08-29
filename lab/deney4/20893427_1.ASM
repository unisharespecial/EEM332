		.MODEL SMALL
		.STACK 64
		.DATA
DATA_IN DB	-13,10,19,-14,-18,9,12,19,-16
ORG 0010
ENK DB ?
		.CODE
MAIN	PROC	FAR		;this is the program entry point
		MOV	AX,@DATA	;load the data segment address

		MOV CX,9
		MOV SI,OFFSET DATA_IN 

BACK:	MOV AL,[SI]
		INC SI
		CMP AL,[SI]
		JLE ARA
		MOV AL,[SI]
ARA:    LOOP BACK
		MOV ENK,AL


		MOV	AH,4CH	;set up to
		INT	21H		;return to DOS
MAIN	ENDP			
		END	MAIN		;this is the program exit point