		.MODEL SMALL
		.STACK 64
		.DATA
DATA_IN DB 96,78,69,54,57
ORG 001
ORTA DB ?
		.CODE
MAIN	PROC	FAR		;this is the program entry point
		MOV	AX,@DATA	;load the data segment address

		MOV CX,5
MOV SI,OFFSET SING_DATA 
SUB AL,AL
AGAIN: CMP AL,[BX]
JA NEXT
MOV AL,[BX]
NEXT: INC BX

	LOOP AGAIN
	MOV DH,AL


		MOV	AH,4CH	;set up to
		INT	21H		;return to DOS
MAIN	ENDP			
		END	MAIN		;this is the program exit point
