;Factorial

.MODEL SMALL
.STACK 100H

.DATA
    str DB 100 DUP ?
    inpmsg DB "Enter number between 0-3 : $"
    outmsg DB "Factorial: $"   
    
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
    
    MOV BL,AL
    MOV AL,1
    MOV n,1
    
    CMP BL,0
    JZ ENDTOP
    
    TOP:
        MUL n
        
        CMP BL,n
        JZ ENDTOP
        
        INC n
        
        JMP TOP:
    ENDTOP:
    
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