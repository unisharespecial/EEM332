LIST p=16F84A
INCLUDE "P16F84A.INC"
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC
ORG 0x00
MEM EQU h'0E'
SAYAC1 EQU H'0C'
SAYAC2 EQU H'0D'
SAYAC EQU H'0E'
CLRF PORTB
BSF STATUS,5
MOVWF TRISA
CLRF TRISB
BCF STATUS,5

BASLA
MOVLW H'00'
MOVWF SAYAC

KONTROL:
BTFSC PORTA,1
GOTO ikinci
GOTO DONGU1

ikinci:
BTFSC PORTA,2
GOTO ucuncu
GOTO DONGU2

ucuncu:
BTFSC PORTA,4
GOTO KONTROL
GOTO DONGU3



DONGU1
MOVF SAYAC,W
ANDLW B'00001111'
CALL CEV7SEG
MOVWF PORTB
INCF SAYAC,F
CALL GECIKME
GOTO DONGU1

CEV7SEG
ADDWF PCL,F
RETLW H'01000001'
RETLW H'01101101'
RETLW H'01100111'
RETLW H'01001100'
RETLW H'01101111'

GOTO KONTROL


DONGU2
MOVF SAYAC,W
ANDLW B'00001111'
CALL CEV7SEG2
MOVWF PORTB
INCF SAYAC,F
CALL GECIKME
GOTO DONGU2

CEV7SEG2
ADDWF PCL,F
RETLW H'11111110'
RETLW H'00111101'
RETLW H'01001011'
RETLW H'01110111'
RETLW H'01111111'

GOTO KONTROL

DONGU3
MOVF SAYAC,W
ANDLW B'00001111'
CALL CEV7SEG3
MOVWF PORTB
INCF SAYAC,F
CALL GECIKME
GOTO DONGU3

CEV7SEG3
ADDWF PCL,F
RETLW H'11111110'
RETLW H'01000001'
RETLW H'00111101'
RETLW H'01101101'
RETLW H'01001011'
RETLW H'01100111'
RETLW H'01110111'
RETLW H'01001100'
RETLW H'01111111'
RETLW H'01101111'

GOTO KONTROL

GECIKME
MOVLW H'FF'
MOVWF SAYAC1
DONGU1
MOVLW H'FF'
MOVWF SAYAC2
DONGU2
DECFSZ SAYAC2,F
GOTO DONGU2
DECFSZ SAYAC1,F
GOTO DONGU1
RETURN 

END