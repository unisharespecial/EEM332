.MODEL SMALL
.STACK 64
.DATA  

DATA DB 'Mr.Gones','$'          ; sonuc için ayrýlan alan
 
		.CODE
MAIN		PROC	FAR		;this is the program entry point
mov     ax,@data
mov     ds,ax
mov     es,ax

mov		cl,2
yaz:		mov ah,09h							    
			lea dx,data 
			int 21h
			mov [data+si+3],'j'		
			dec cl	
			jnz yaz

			
    	MOV	AH,4CH									;set up to
		INT	21H										;return to DOS
MAIN	ENDP			
		END	MAIN									;this is the program exit point
