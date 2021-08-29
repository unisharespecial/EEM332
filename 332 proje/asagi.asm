LIST p=16F84A
INCLUDE "P16F84A.INC"
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
ORG 0x00
SAYAC3 EQU H'0C'
SAYAC4 EQU H'0D'
SAYACY EQU H'0E'
CLRF PORTB
BSF STATUS,5
CLRF TRISB
BCF STATUS,5

BUTTONTEST
BTFSS PORTA,2
GOTO BASLA
BCF PORTB,0
GOTO BUTTONTEST


BASLA
MOVLW H'00'
MOVWF SAYACY

DONGU
MOVF SAYACY,W
ANDLW B'00001111'
CALL ASAGI
MOVWF PORTB
INCF SAYACY,F
CALL GECIKME
GOTO DONGU

ASAGI
ADDWF PCL,F
RETLW H'71'
RETLW H'79'
RETLW H'5E'
RETLW H'39'
RETLW H'7C'
RETLW H'77'
RETLW H'6F'
RETLW H'7F'
RETLW H'07'
RETLW H'7D'
RETLW H'6D'
RETLW H'66'
RETLW H'4F'
RETLW H'5B'
RETLW H'06'
RETLW H'3F'

GECIKME
MOVLW H'FF'
MOVWF SAYAC3

DONGU3
MOVLW H'FF'
MOVWF SAYAC4

DONGU4
DECFSZ SAYAC4,F
GOTO DONGU4
DECFSZ SAYAC3,F
GOTO DONGU3
RETURN 
END