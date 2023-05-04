.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC

    ; 1 will request input
    
MOV AH,1
INT 21H  
    ; storing input into temporary register
MOV BL,AL

    ; converting upper to lower and vice-versa

CMP BL,91
JG Line1

ADD BL,64
Line1:
SUB BL,32

    ;ADD DL,-10
    ; PRINTING NEW LINE (actually printing 80 chars)
    ; setting for output request
MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H

MOV DL,BL
MOV AH,2
INT 21H

MOV AH,4CH  ;eat extra printer char
INT 21H

MAIN ENDP
END MAIN

