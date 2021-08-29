.MODEL SMALL
.STACK 64
.DATA  

DATA db 10,19,’ ’,10,19        
 
.CODE
MAIN	PROC	FAR		
mov     ax,@data
mov     ds,ax
mov     es,ax
dizi_al:	mov ah,01                         
			int 21h                          
			cmp al,13                          
			jz yaz                          
			inc si                             
			cmp al,61h                         
			jg degis                        
			jl sbt                      
degis:		sub al,20h                       
sbt:		sub al,0h                         
			mov [DATA+si],al                
			jmp dizi_al
yaz:		mov ah,09h                       
			lea dx,DATA 
			int 21h 
dosa:       mov ah,4ch 
			int 21h 
MAIN		ENDP			
			END	MAIN		;this is the program exit point