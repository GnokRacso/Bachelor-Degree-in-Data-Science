.MODEL SMALL
.STACK 100
.DATA
    STR1    DB  0DH, 0AH, "Before reverse"
            DB  0DH, 0AH, "--------------$"
            
    VAR1    DB  "COMPUTER"
    VAR2    DB  8 DUP("*") 
    
    STR2    DB  0DH, 0AH, "After reverse"
            DB  0DH, 0AH, "-------------$" 
            
    STR3    DB  0DH, 0AH, "VAR1 = $"
    STR4    DB  0DH, 0AH, "VAR2 = $"
            
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV AH, 09H
    LEA DX, STR1
    INT 21H
    
    MOV AH, 09H
    LEA DX, STR3
    INT 21H  
    
    ;DISPLAY COMPUTER
    MOV CX, 8
    MOV SI, 0
    
    L1:
        MOV AH, 02H
        MOV DL, VAR1[SI]
        INT 21H
        
        INC SI
    LOOP L1
    
    MOV AH, 09H
    LEA DX, STR4
    INT 21H
    
    ;DISPLAY ********
    MOV CX, 8
    L2:   
        MOV AH, 02H
        MOV DL, VAR2
        INT 21H
        
    LOOP L2
    
    MOV AH, 09H
    LEA DX, STR2
    INT 21H
    
    MOV AH, 09H
    LEA DX, STR3
    INT 21H  
    
    ;DISPLAY COMPUTER
    MOV CX, 8
    MOV SI, 0
    
    L3:
        MOV AH, 02H
        MOV DL, VAR1[SI]
        INT 21H
        
        INC SI
    LOOP L3    
    
    MOV AH, 09H
    LEA DX, STR4
    INT 21H  
    
    ;DISPLAY RETUPMOC
    MOV CX, 8
    MOV SI, 7
    
    L4:
        MOV AH, 02H
        MOV DL, VAR1[SI]
        INT 21H
        
        DEC SI
    LOOP L4  
    
    MOV AX, 4C00H
    INT 21H
    
MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    

                    

