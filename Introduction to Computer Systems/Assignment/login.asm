.DATA
    ;--------------------STRING---------------------------------------------------------------------------------------   
    TEST1   DB 0DH, 0AH, "1$"
    TEST2   DB 0DH, 0AH, "2$" 
    
    LOGO    DB 0DH, 0AH, "  _________                                                     _________"
            DB 0DH, 0AH, " /         \___                                             ___/         \"
            DB 0DH, 0AH, " |             \__                                       __/             |"
            DB 0DH, 0AH, "  \               \___                               ___/               /"
            DB 0DH, 0AH, "   \                  \___       _       _       ___/                  /"
            DB 0DH, 0AH, "    \                     \_      \     /      _/                     /"
            DB 0DH, 0AH, "     \                      \_     \   /     _/                      /"
            DB 0DH, 0AH, "      \                       \_    \_/    _/                       /"
            DB 0DH, 0AH, "       \_                       \__ (_) __/                       _/"
            DB 0DH, 0AH, "         \__                       /   \_                      __/"
            DB 0DH, 0AH, "            \_______        _____//\ _ /\\_______        _____/"
            DB 0DH, 0AH, "               /    \______/     /  |_|  \       \______/  \"
            DB 0DH, 0AH, "              /               __/   |_|   \__               \"
            DB 0DH, 0AH, "              \            __/      |_|      \__            /"
            DB 0DH, 0AH, "               \        __/         |_|         \__        /"
            DB 0DH, 0AH, "                \______/            \-/            \______/"
            DB 0DH, 0AH, "=========================================================================="
            DB 0DH, 0AH, "||              Welcome to Queen Alexandra Butterfly Farm               ||"
            DB 0DH, 0AH, "==========================================================================" 
            DB 0DH, 0AH, "      1. STAFF LOGIN"
            DB 0DH, 0AH, "      2. VIEW MENU"
            DB 0DH, 0AH, "      3. EXIT"
            DB 0DH, 0AH, " "
            DB 0DH, 0AH, "      ENTER YOUR SELECTION:  $"  
    ;LOGIN MENU
    ERROR_MSG_1     DB 0DH, 0AH, "  INVALID INPUT DETECTED.PLEASE TRY AGAIN!$"
    PRESS_KEY       DB 0DH, 0AH, "  PRESS ANY KEY TO CONTINUE([SPACE] TO EXIT)......$"
    
    ;STAFFLOGIN FUNC        
    STAFFLOGINSTR1  DB 0DH, 0AH, "PLEASE ENTER YOU STAFF ID AND PASSWORD$"
    USERNAMESTR     DB 0DH, 0AH, "  Username:  $" 
    PASSWORDSTR     DB 0DH, 0AH, "  Password:  $"
    LOGINOTSTR      DB 0DH, 0AH, "  LOGIN TIME HAVE PASSED, PLEASE TRY AGAIN!"
                    DB 0DH, 0AH, "  (PRESS ANY KEY TO CONTINUE LOGIN)$"
    ERROR_MSG_2     DB 0DH, 0AH, "	USERNAME DOES NOT EXISTS/INCORRECT PASSWORD DETECTED!"
		            DB 0DH, 0AH, "	TRY AGAIN OR EXIT (A = AGAIN/E = EXIT):	$"
    
    ;END SYSTEM
    ENDSYS_MSG      DB 0DH, 0AH, "THANK YOU FOR USING THIS SYSTEM!$"
          
    ;--------------------VARIABLE THAT GOT DATA-------------------------------------------------------------------------------------
    ;STAFF
    UNAME           DB "ICS$"
    UPSW            DB "1024$"
    UIC             DB "000906141234$" 
    AST             DB "*$"
    NUM             DB 0
    ;--------------------VARIABLE FOR DATA INPUT------------------------------------------------------------------------------------------
    ;LOGIN
    LOGINSELECT     DB ?
    
    ;STAFF ID
    INSERTNUMID     DB 0
    STAFFNUMID      DB 0
    INID            LABEL BYTE
    MAXID           DB 10
    ACTID           DB ?
    ACTINID         DB 10 DUP("$")
    ID_ARRAY        DB 10 DUP("$")
    
    ;STAFF PW
    INSERTNUMPW     DB 0
    STAFFNUMPW      DB 0 
    INPW            LABEL BYTE
    MAXPW           DB 20
    ACTPW           DB ?
    ACTINPW         DB 20 DUP("$")
    PW_ARRAY        DB 20 DUP("$")
    
    ;STAFF IC
    INSERTNUMIC     DB 0
    STAFFNUMIC      DB 0
    INIC            LABEL BYTE
    MAXIC           DB 12
    ACTIC           DB ?
    ACTINIC         DB 13 DUP("$")
    IC_ARRAY        DB 13 DUP("$")
    
    ;TIMER
    OLDMIN          DB 0
    NEWMIN          DB 0
    DIFFMIN         DB 0
    IN_ONE_MIN      DB 1
    OVER_ONE_MIN    DB 0                    
    
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX 
	    
COMPANY_LOGIN:	    
    CALL CLEARSCREEN 
        
	MOV AH, 09H
	LEA DX, LOGO
	INT 21H
	    
	MOV AH, 01H
	INT 21H
	SUB AL, 30H
	MOV LOGINSELECT, AL
	    
	CMP LOGINSELECT, 1
	JE LOGIN_STAFF
	CMP LOGINSELECT, 2
	JE LOGIN_MENU
	CMP LOGINSELECT, 3
	JE USER_FINISH
	
	JNE ERROR_MSG_LOGIN
    
    LOGIN_STAFF:
        JMP STAFF_LOGIN
    LOGIN_MENU:
        JMP MENU_VIEW       
    ERROR_MSG_LOGIN:
        CALL ERROR_FORMAT
        JMP COMPANY_LOGIN     
    
STAFF_LOGIN: 
    CALL CLEARSCREEN
    MOV AH, 09H
    LEA DX, STAFFLOGINSTR1
    INT 21H
      
    STAFF_ID:
        MOV AH, 09H
        LEA DX, USERNAMESTR
        INT 21H
    
        MOV SI, 0               
        INSERTID:
            MOV AH, 2CH
            INT 21H
            MOV OLDMIN, CL
            
            MOV AH, 01H
            INT 21H
            MOV ACTINID[SI], AL
            INC INSERTNUMID
        
            MOV BL, ACTINID[SI]
            CMP BL, 13
            JE STAFF_PASSWORD
        
            INC SI
            JMP INSERTID
        
    STAFF_PASSWORD:
        MOV AH, 09H
        LEA DX, PASSWORDSTR
        INT 21H
            
        MOV SI, 0
        INSERTPW:
            MOV AH, 08H
            INT 21H
            
            CMP AL, ' '
            JE INSERTPW
            CMP AL, 08H
            JE INSERTPW
            CMP AL, 09H   
            JE INSERTPW
            
            MOV ACTINPW[SI], AL
            
            MOV AH, 02H
            MOV DL, AST
            INT 21H
                
            INC SI
            JMP INSERTPW

    COMPARETIME:
        CALL MIN_COUNTDOWN 
        CMP DIFFMIN, 0
        JE COMPAREIDPW
        JA LOGIN_OVERTIME
        
        COMPAREIDPW:
            JMP COMPAREID
        LOGIN_OVERTIME:
            CALL CLEARSCREEN
            
            MOV AH, 09H
            LEA DX, ERROR_OT_MSG
            INT 21H
            
            MOV AH,01H
		    INT 21H
		    CMP AL,' '
		    JE	USER_FINISH
		    JMP STAFF_ID
		
    COMPAREID:
        MOV NUM, 0 
        COUNTNUMID:
            INC NUM
            
            CMP UNAME, 36
            JNE COUNTNUMID 
               
        MOV DI, 0
        MOV CH, 0
        MOV CL, NUM
        COMPAREOFFSETID:
            MOV AL, ACTINID[DI]
            CMP AL, UNAME[DI]
            JNE INVALIDLOGIN
            
            INC DI
        LOOP COMPAREOFFSETID
        JMP COMPAREPW
    COMPAREPW:
        MOV NUM, 0
        COUNTNUMPW:
            INC NUM
            
            CMP UPSW, 36
            JNE COUNTNUMPW
        MOV DI, 0
        MOV CH, 0
        MOV CL, NUM
        COMPAREOFFSETPW:
            MOV AL, ACTINPW[DI]
            CMP AL, UPSW[DI]
            JNE INVALIDLOGIN
            
            INC DI
        LOOP COMPAREOFFSETID
        JMP MENU_ORDER
    
    INVALIDLOGIN:
        CALL USER_FINISH
        
MENU_ORDER:
    CALL CLEARSCREEN
    JMP END_SYSTEM
                                
    
MENU_VIEW:
    CALL CLEARSCREEN
    MOV AH, 09H
    LEA DX, TEST2
    INT 21H
    
    JMP END_SYSTEM
    
END_SYSTEM:
    MOV AH, 4CH
    INT 21H        

MAIN ENDP

;------------COUNT ARRAY------------------------------
 

;------------LOGIN countdown (1 MIN)------------------
MIN_COUNTDOWN PROC
    MOV AH, 2CH
    INT 21H
    MOV NEWMIN, CL

    MOV AL, NEWMIN
    SUB AL, OLDMIN
    MOV DIFFMIN, AL

    RET
MIN_COUNTDOWN ENDP

;------------ERROR MSG------------------
	ERROR_FORMAT:
		CALL GENERATE_SOUND

		MOV AH,09H
		LEA DX,ERROR_MSG_1
		INT 21H

		MOV AH,09H
		LEA DX,PRESS_KEY
		INT 21H

		MOV AH,01H
		INT 21H
		CMP AL,' '
		JE	USER_FINISH

		RET


;------------Exit (user select finish)----------------
USER_FINISH PROC
    		
	MOV AH,09H
	LEA DX,ENDSYS_MSG 
	INT 21H		
    JMP END_SYSTEM

;----------clear screen funtion----------------------
CLEARSCREEN PROC

	XOR AX,AX
	XOR BX,BX
	XOR CX,CX
	XOR DX,DX
	
	MOV AX,0600H
	MOV BH,07H
	MOV CX,0000H
	MOV DX,204FH
	INT 10H
	
	MOV AH,02h
	MOV BH,0
	MOV DX,0000H
	INT 10H	    

	RET
CLEARSCREEN ENDP 

;------------------------GENERATE SOUND---------------------------------
GENERATE_SOUND PROC

SOUND:
    MOV     AL, 182         ; Prepare the speaker for the
    OUT     43H, AL         ;  note.
    MOV     AX, 3224        ; Frequency number (in decimal)
                                
    OUT     42H, AL         ; Output low byte.
    MOV     AL, AH          ; Output high byte.
    OUT     42H, AL 
    IN      AL, 61H         ; Turn on note (get value from
                                ; port 61h).
    OR      AL, 00000011B   ; Set bits 1 and 0.
    OUT     61H, AL         ; Send new value.
    MOV     BX, 4          ; Pause for duration of note.
PAUSE1:
    MOV     CX, 65535
PAUSE2:
    DEC     CX
    JNE     PAUSE2
    DEC     BX
    JNE     PAUSE1
    IN      AL, 61H         ; Turn off note (get value from
                                 ;port 61h).
    AND     AL, 11111100B   ; Reset bits 1 and 0.
    OUT     61H, AL         ; Send new value
		
RET
GENERATE_SOUND ENDP  

END MAIN