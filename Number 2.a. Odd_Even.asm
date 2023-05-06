;EVEN ODD

.MODEL SMALL
.STACK 100H

.DATA
    str DB 100 DUP ?
    inpmsg DB "Enter number between 0-9 : $"
    
    odd DB "ODD$"
    even DB "EVEN$"
        
    n DB ?
    dv DB 2
    
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
        
    DIV dv
    CMP AH,0
    JZ EVENN
    
    CALL NEWLINE
    LEA DX,odd
    
    JMP ENDEVENN
    EVENN:
        CALL NEWLINE
        LEA DX,even
    ENDEVENN:
    
    MOV AH,09H
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