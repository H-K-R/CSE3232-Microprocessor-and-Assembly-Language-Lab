;sorting

.MODEL SMALL
.STACK 100H

.DATA
    str DB 100 DUP ?
    inpmsg DB "Enter the string: $"
    outmsg DB "After Sorting: $"
    
    n DW ?
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
       
        ;sorting segment increasing order (Using bubble sort)
        MOV n,SI;
        SUB n,1
        
        MOV CX,n
        OUTTOP:
            MOV SI,0
            MOV DI,1           
            TOP:
                MOV AL,str[SI]    
                CMP AL,str[DI]
                JL SKIP ; JG to decreasing order sort
                
                XCHG AL,str[DI]
                MOV str[SI],AL
                
                SKIP:
                
                CMP DI,n
                JZ ENDTOP
           
                INC DI
                INC SI
                JMP TOP:
            ENDTOP:        
        LOOP OUTTOP:  
          
     
     ;Printing segment
     CALL NEWLINE
     LEA DX,outmsg 
     MOV AH,09H
     INT 21H   
     
     INC n
     MOV DI,0
     
     OUTPUT:
        MOV DL,str[DI]
        CMP DI,n
        JZ ENDOUTPUT
        
        MOV DL,str[DI]
        MOV AH,2
        INT 21H
        INC DI   
        
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

