LIST P=16F84A		;Derleyici programa Pic 16F84A?y? tan?t?r.
INCLUDE P16F84A.INC	;Programa P16F84A.INC kütüphanesini ekler.
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC	;Pic uyum kodu
C1 EQU 0x0C			; 0C sayac? için C1 etiketi tan?mlan?r.
C2 EQU 0x0D			;0D sayac? için C2 etiketi tan?mlan?r.

    ORG 0x00
    goto init

    ORG 0x04
    goto $               


init:
BSF STATUS,5			;Bank 1?e geçer, yazmaçlar?n 1. sayfas?n? ayarlar.
CLRF TRISB			;TRISB içeri?ini s?f?rlar veya resetler.
BCF STATUS,5			;Bank 0?a geçer, yazmaçlar?n 0. sayfas?n? ayarlar.
CLRF PORTB			;PORTB bitlerini temizler, PORTB?ye reset atar.
BANKSEL TRISA
CLRF TRISA
BANKSEL PORTA
CLRF PORTA
                                
; A4?e bas?l?nca Buzzer kesikli ötecek ve onunla beraber 8 led yanarak kayacakt?r

BASLA:				;BASLA etiketi tan?mland?.

     MOVLW A'00000100' 	;W?ye A'00000100' de?erleri yüklendi.
     MOVWF PORTA         	;PORTA?ye W de?erini atad?. 3. bit ç?k?? (1) olarak atand?.  
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00000001' 	;W?ye B'00000001' de?erleri yüklendi.
     MOVWF PORTB         	;PORTB?ye W de?erini atad?. 0. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00000010' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 7. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00000100' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB		;PORTB?ye W de?erini atad?. 1. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00001000' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 6. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00010000' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 2. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'00100000' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 5. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'01000000' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 3. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
     MOVLW B'10000000' 	;W?ye B'00000000' de?erleri yüklendi.
     MOVWF PORTB     		;PORTB?ye W de?erini atad?. 4. bit ç?k?? (1) olarak atand?.
CALL DELAY			;DELAY etiketini ça??r.
CALL DELAY			;DELAY etiketini ça??r.
GOTO BASLA			;BASLA etiketine git.

DELAY:				;DELAY etiketi tan?mland?.
     MOVLW .255		;W?ye 255 decimal de?erleri yüklendi.
     MOVWF C2			;C2?e W de?erini atad?.
   D2:				;D2 etiketi tan?mland?.
	MOVLW .255		;W?ye 255 decimal de?erleri yüklendi.
	MOVWF C1		;C1?e W de?erini atad?.
   D1: 				;D1 etiketi tan?mland?.
      DECFSZ C1,f		;C1 de?erini 1 azalt.
   GOTO D1			;D1 etiketine git.
     DECFSZ C2,f		;C2 de?erini 1 azalt.
   GOTO D2			;D2 etiketine git.
RETURN			;döngü ça??r?ld??? yere geri döner.

END				;Kodun biti? habercisi.