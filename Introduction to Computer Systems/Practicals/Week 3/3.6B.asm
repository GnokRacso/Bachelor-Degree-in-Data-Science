.DATA
    QUAN    DB 0DH, 0AH, "Quantity (unit): $"
    UNIT    DB 0DH, 0AH, "Unit price (RM): $"
    WRONG   DB 0DH, 0AH, "Invalid input! Enter digit only!$"   
    TOTAL   DB 0DH, 0AH, "Total Amount is RM$" 
    
    NUM     DB ?
    NUM1    DB ?
    TEN     DB 10
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    
    ENTERQUANTITY:
        MOV AH, 09H
        LEA DX, QUAN
        INT 21H
    
        MOV AH, 01H
        INT 21H 
        MOV NUM, AL
        JMP COMPARE 
        
        COMPARE:
            CMP NUM, 48
            JB ERROR
            CMP NUM, 57
            JA ERROR
            
            JMP ENTERUNIT
    ERROR:
        MOV AH, 09H
        LEA DX, WRONG
        INT 21H
        
        JMP ENTERQUANTITY
                
    ENTERUNIT:
        MOV AH, 09H
        LEA DX, UNIT
        INT 21H
        
        MOV AH, 01H
        INT 21H
        MOV NUM1, AL
        JMP COMPARE1
        
        COMPARE1:
            CMP NUM1, 48
            JB ERROR1
            CMP NUM1, 57
            JA ERROR1
            
            JMP TOTALAMOUNT
    ERROR1:
        MOV AH, 09H
        LEA DX, WRONG
        INT 21H
        
        JMP ENTERUNIT
            
    TOTALAMOUNT:
        MOV AH, 09H
        LEA DX, TOTAL
        INT 21H
        
        SUB NUM, 48
        SUB NUM1, 48 
        
        MOV AL, NUM
        MUL NUM1
        DIV TEN
        MOV BX, AX
        
        MOV AH, 02H
        MOV DL, BL
        ADD DL, 48
        INT 21H
        
        MOV AH, 02H
        MOV DL, BH
        ADD DL, 48
        INT 21H
        
        JMP QUIT
    
    QUIT:
    MOV AH, 4CH
    INT 21H    
    
MAIN ENDP
END MAIN
        
    
    
    
    
    