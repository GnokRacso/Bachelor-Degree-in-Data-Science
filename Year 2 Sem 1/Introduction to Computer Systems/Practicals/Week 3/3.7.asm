.DATA

    NUM     DB 79, 93, 30, 4, 6, 1
    STR     DB 0DH, 0AH, "Even number is: $"
    COMA    DB ",$"
    TWO     DB 2  
    TEN     DB 10
    
.CODE
MAIN PROC       
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09H
    LEA DX, STR
    INT 21H
    
    MOV SI, 0
    MOV CH, 0
    MOV CL, 6
    L1:  
        MOV AL, NUM[SI]
        MOV AH, 0
        DIV TWO
        MOV BX, AX
        CMP BH, 0 
        JE PRINT  
        
        INC SI

        
    LOOP L1 
    
    PRINT:

            MOV AL, NUM[SI]            
            MOV AH, 0
            DIV TEN
            MOV BX, AX
            
            MOV AH, 02H
            MOV DL, BL
            ADD DL, 30H
            INT 21H
            
            MOV AH, 02H
            MOV DL, BH
            ADD DL, 30H
            INT 21H
            
            MOV AH, 09H
            LEA DX, COMA
            INT 21H     
                 
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
       
