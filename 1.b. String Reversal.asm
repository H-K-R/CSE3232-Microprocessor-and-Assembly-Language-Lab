; string revarsal

.MODEL SMALL
.STACK 100H

.DATA
    str DB 100 DUP ?
    inpmsg DB "Enter the string: $"
    outmsg DB "Reversed string: $"
    n DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,inpmsg 
    MOV AH,09H
    INT 21H
    
    MOV SI,0
    MOV DI,0
    
    INPUT:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JZ ENDINPUT
        
        MOV str[SI],AL 
        INC SI
           
        JMP INPUT
     ENDINPUT:
           
       ; printing new line 
        CALL NEWLINE

        LEA DX,outmsg 
        MOV AH,09H
        INT 21H
        
        DEC SI
        ;reversed string output    
     OUTPUT:
        MOV DL,str[SI]
        CMP SI,0
        JL ENDOUTPUT
        
        MOV DL,str[SI]
        MOV AH,2
        INT 21H
        DEC SI   
        
        JMP OUTPUT
     ENDOUTPUT:     
    
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

