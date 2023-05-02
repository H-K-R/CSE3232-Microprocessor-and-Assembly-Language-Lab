; Count everything


.MODEL SMALL
.STACK 100H

.DATA
    inpmsg DB "Enter the string: $"
    NV DB "Number of Vowels: $"
    NC DB "Number of Consonant: $"
    ND DB "Number of Digits: $"
    NS DB "Number of Spaces: $"
    
    vowels DB "AEIOUaeiou$"
    
    vc DB 48
    cc DB 48
    dc DB 48
    sc DB 48
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,inpmsg 
    MOV AH,09H
    INT 21H
    
    INPUT:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JZ ENDINPUT
        
        ;Counting vowel and consonant
        
        CMP AL,'z'
        JG NOTALATTER
        CMP AL,'A'
        JL NOTALATTER
        CMP AL,'Z'
        JG TOPP   
        JMP ENDTOPP
        TOPP:
            CMP AL,'a'
            JL NOTALATTER          
        ENDTOPP:       
        
        
        MOV SI,0
        MOV CX,12        
        TOP:
            CMP AL,vowels[SI]
            JZ VOW
            INC SI        
        LOOP TOP:
        DEC vc
        INC cc
        VOW:
            INC vc
        
        NOTALATTER:
            
        ;Counting space
        CMP AL,' '
        JZ SPACE
        
        DEC sc
        SPACE:
            INC sc
        
        ;Digit count segment
        CMP AL,'0'
        JL NOTADIGIT:
        CMP AL,'9'
        JG NOTADIGIT:
        
        INC dc    
        NOTADIGIT:    
          
        JMP INPUT
    ENDINPUT:
       
    
    ;printig number of vowels
    CALL NEWLINE
    LEA DX,NV
    MOV AH,09H
    INT 21H
    
    MOV DL,vc
    MOV AH,2
    INT 21H    
    
    ;printing number of consonant    
    CALL NEWLINE
    LEA DX,NC
    MOV AH,09H
    INT 21H
    
    MOV DL,cc
    MOV AH,2
    INT 21H    
    
    ;printing number of digits
    CALL NEWLINE
    LEA DX,ND
    MOV AH,09H
    INT 21H
    
    MOV DL,dc
    MOV AH,2
    INT 21H
    
    ;printing number of spaces
    
    CALL NEWLINE
    LEA DX,NS
    MOV AH,09H
    INT 21H
    
    MOV DL,sc
    MOV AH,2
    INT 21H    
     
    MOV AH,4CH
    INT 21H    
    
MAIN ENDP

; Newline print function
NEWLINE PROC
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    RET
NEWLINE ENDP

END MAIN

