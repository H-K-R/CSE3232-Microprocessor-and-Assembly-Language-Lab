;Series summation

.MODEL SMALL
.STACK 100H

.DATA
    str DB 100 DUP ?
    inpmsg DB "Enter number between 1-3 : $"
    outmsg DB "Summation: $"   
    
    n DB ?
    d DB 2
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    LEA DX,inpmsg
    MOV AH,09H
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    
    MOV n,AL
    INC n
    
    MUL n
    DIV d
    
    MOV n,AL
    
     
    CALL NEWLINE
       
    LEA DX,outmsg
    MOV AH,09H
    INT 21H
    
    MOV DL,n
    ADD DL,48
    MOV AH,2H
    INT 21H
     
    
    MOV AH,4CH
    INT 21H    
    
MAIN ENDP

NEWLINE PROC
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    RET
NEWLINE ENDP

END MAIN