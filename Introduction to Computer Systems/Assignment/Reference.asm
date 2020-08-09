.MODEL SMALL
.STACK 100
.DATA
	NL DB 10,13,"$"
	;=======COMPANY NAME===========
	COMPANY DB 13,10,13,10," ==============================="
            	DB 13,10,      "     JASMINE RICE ENTERPRISE"
	    	DB 13,10,      " ===============================$"
	
	;=======LOGIN MENU=============
	LOGINMENU DB 13,10," 1. STAFF LOGIN"
                  DB 13,10," 2. VIEW RICE MENU"
		  DB 13,10," 3. EXIT$"

	;==============RICE MENU FOR CUSTOMER=============
	RICEMENU  DB 13,10," ==================="
                  DB 13,10,"    TYPE OF RICE"
		  DB 13,10," ==================="
		  DB 13,10," 1. PACKED RICE"
		  DB 13,10," 2. UNPACKED RICE"
		  DB 13,10," 3. BACK TO MENU$"
	
	;===============UNPACKED RICE MENU===============
	UNPACK_MENU DB 13,10
		    DB 13,10,"                   UNPACK MENU                "
		    DB 13,10,"                   -----------"
		    DB 13,10
		    DB 13,10,"  ================================================"
		    DB 13,10,"  ItemNo.   Type of Rice          Price (RM/100g) "
		    DB 13,10,"  ================================================"
		    DB 13,10,"    R1.     Fragrant of Rice           0.50"
		    DB 13,10,"    R2.     Basmati Rice               1.00"
		    DB 13,10,"    R3.     Brown Rice                 0.60"
	  	    DB 13,10,"    R4.     Glutinuous Rice            0.60"
		    DB 13,10,"    R5.     Rice Vermicelli            0.60"
		    DB 13,10,"  ================================================"
		    DB 13,10,"$"

	;============PACKED RICE MENU=====================
	PACK_MENU DB 13,10
		  DB 13,10,"                           PACK MENU                "
		  DB 13,10,"                          ------------"
		  DB 13,10
		  DB 13,10,"  ================================================================"
		  DB 13,10,"  ItemNo.   Type of Rice          Weight (kg)    Price (RM/kg) "
		  DB 13,10,"  ================================================================"
		  DB 13,10,"   R1.      Fragrant of Rice         10 (B)          48.50        "
		  DB 13,10,"                                      5 (S)          25.50        "
		  DB 13,10,"  ----------------------------------------------------------------"
		  DB 13,10,"   R2.      Basmati Rice              5 (B)          47.50       "
		  DB 13,10,"                                      1 (S)          10.00       "
		  DB 13,10,"  ----------------------------------------------------------------"
		  DB 13,10,"   R3.      Brown Rice               10 (B)          56.90       "
		  DB 13,10,"                                      5 (S)          30.00       "
		  DB 13,10,"  ----------------------------------------------------------------"
	  	  DB 13,10,"   R4.      Glutinuous Rice          10 (B)          58.90       "
	  	  DB 13,10,"                                      5 (S)          31.00       "
		  DB 13,10,"  ----------------------------------------------------------------"
		  DB 13,10,"   R5.      Rice Vermicelli          10 (B)          60.80       "
		  DB 13,10,"                                      5 (S)          32.00       "
		  DB 13,10,"  ----------------------------------------------------------------"
		  DB 13,10,"$"

	SYSTEM_MENU DB 13,10
		    DB 13,10,"	================================"
		    DB 13,10,"	1. ORDER"
		    DB 13,10,"	2. STOCK REPORT"
		    DB 13,10,"	3. BACK TO MENU"
		    DB 13,10,"	================================"
	            DB 13,10,"	ENTER YOUR SELECTION:	$"
	
	;==STRING INPUT FOR LOGIN==
	ID_LIST	LABEL BYTE
	IDMAX_LEN DB 7
	IDACT_LEN DB ?
	IDENTER_DATA DB 7 DUP("$")

	PASS_LIST LABEL BYTE
	PASSMAX_LEN DB 7
	PASSACT_LEN DB ?
	PASSENTER_DATA DB 7 DUP("$")

	LOGINSTR1     DB 13,10,13,10," ENTER YOUR SELECTION:	$"
	LOGINSTR2     DB 13,10,"	ENTER STAFF ID:	$"
	LOGINSTR4     DB 13,10,"	ENTER STAFF PASSWORD:	$"

	EXITSTR1      DB 13,10,"	BACK TO MENU?(Y/N):	$"
	PASSSTR1      DB 13,10,"	ENTER SYSTEM SECRET PASSWORD TO CHANGE PASSWORD:	$"
	FORGETPASSSTR DB 13,10,"	FORGET PASSWORD?(Y/N): $"
	ERROR_MSG_1   DB 13,10,"	INVALID INPUT DETECTED.PLEASE TRY AGAIN!$"
	ERROR_MSG_2   DB 13,10,"	USERNAME DOES NOT EXISTS!"
		      DB 13,10,"	TRY AGAIN OR EXIT (A = AGAIN/E = EXIT):	$"
	ERROR_MSG_3   DB 13,10,"	INCORRECT PASSWORD DETECTED!"
		      DB 13,10,"	TRY AGAIN OR EXIT (A = AGAIN/E = EXIT):	$"
	PRESS_KEY DB 13,10,"	PRESS ANY KEY TO CONTINUE([SPACE] TO EXIT)......$"

	PASSSTR2       DB 13,10,"	ENTER NEW PASSWORD(6 CHARACTERS):	$"
	PASSSTR3       DB 13,10,"	CONFIRM PASSWORD		:	$"
	PASSSTR4       DB 13,10,"	ARE YOU SURE WANT TO CHANGE THE PASSWORD:	$"
	NOT_MATCH      DB 13,10,"	INCORRECT SECRET PASSWORD DETECTED! FAILED TO CHANGE PASSWORD!$"
	PASS_NOT_MATCH DB 13,10,"	PASSWORD NOT MATCH!"
		       DB 13,10,"	TRY AGAIN OR EXIT (A= AGAIN/ E = EXIT):	$"

	SUCCESS_LOGIN  DB 13,10,"===================================================================" 
		       DB 13,10,"	CONGRATULATION, WELCOME TO JASMINE RICE ENTERPRISE"
		       DB 13,10,"===================================================================$"
	FORGET_PASS    DB 13,10,"==================================================================="
		       DB 13,10,"				FORGET PASSWORD"
		       DB 13,10,"===================================================================$"
	
	CHANGED     DB 13,10,"	PASSWORD CHANGE SUCCESSFULLY!!!$"
	ERROR_MSG_4 DB 13,10,"	FAILED TO CHANGE PASSWORD!$"
	END_MSG     DB 13,10,13,10,"THANK YOU FOR USING THIS SYSTEM!!!$"
	
	;============LOGIN PASSWORD=========

	SECRETPASS  DB "YLJHLL$"
	LOGINSTAFF  DB "JOAN00$"
	PASSSTAFF   DB "JH1018$"
	AST         DB "*$"
	
	LOGINSLEC  DB ?
	RICESLEC   DB ?
	EXITSLEC   DB ?
	FORGETSLEC DB ?
	AGAINSLEC  DB ?
	SURESLEC   DB ?
	
	COUNT    DB 0
	NUM      DB 0

	PASSARR1        DB 6 DUP("$")
	PASSARR2        DB 6 DUP("$")
	STAFF_PASS_ARR  DB 6 DUP("$")
	SECRET_PASS_ARR DB 6 DUP ("$")

	;==================== SHARED VARIABLE BY REPORTS AND ORDER ==================
	;----PRICE OF RICE
	FR_10KG_PRICE DW 485  ;--48.50
	FR_5KG_PRICE  DW 255  ;--25.50
	FR_100G_PRICE DB 5    ;---0.50

	BA_5KG_PRICE  DW 475 ;--47.50
	BA_1KG_PRICE  DW 100 ;--10.00
	BA_100G_PRICE DB 10   ;--1.00

	BR_10KG_PRICE DW 569  ;--56.90
	BR_5KG_PRICE  DW 300  ;--30.00
	BR_100G_PRICE DB 6    ;---0.60

	GL_10KG_PRICE DW 589  ;--58.90
	GL_5KG_PRICE  DW 310  ;--31.00
	GL_100G_PRICE DB 6    ;---0.60

	VE_10KG_PRICE DW 608  ;--60.80
	VE_5KG_PRICE  DW 320  ;--32.00
	VE_100G_PRICE DB 6    ;---0.60	  

	ZERO    DB 0
	ONE     DB 1
	FIVE    DB 5
	TEN     DB 10
	HUNDRED DB 100

	DOT DB "."
	KG  DB " kg$"
	RM  DB 'RM $'
	
	;----FOR PACK RICE (QTY)  
	FR_P_5KG_TOTALSOLD DB 21   ;5kg - 25.50
	BA_P_1KG_TOTALSOLD DB 14   ;1kg - 10.00
	BR_P_5KG_TOTALSOLD DB 12   ;5kg - 30.00
	GL_P_5KG_TOTALSOLD DB 13   ;5kg - 31.00
	VE_P_5KG_TOTALSOLD DB 10   ;5kg - 32.00

	;----FOR PACK RICE (QTY)   
	FR_P_10KG_TOTALSOLD DB 15  ;10kg - 48.50 
	BA_P_5KG_TOTALSOLD  DB 12  ;5kg - 47.50 
	BR_P_10KG_TOTALSOLD DB 11  ;10kg - 56.90 
	GL_P_10KG_TOTALSOLD DB 10  ;10kg - 58.90 
	VE_P_10KG_TOTALSOLD DB 8   ;10kg - 60.80 

	;----FOR UNPACK RICE (kg)  
	FR_UNP_TOTALSOLD DW 1853   ;--185.3kg ;Fragrant of Rice - 0.50 / 100g
	BA_UNP_TOTALSOLD DW 602    ;Basmati Rice - 1.00 / 100g
	BR_UNP_TOTALSOLD DW 848    ;Brown Rice - 0.60 / 100g
	GL_UNP_TOTALSOLD DW 1171   ;Glutinuous Rice - 0.60 / 100g
	VE_UNP_TOTALSOLD DW 939    ;Rice Vermicelli - 0.60 / 100g

	;========================== FOR ORDER =======================

	ORDER_MENU  DB 13,10
		    DB 13,10,"  ORDER"
		    DB 13,10,"  -----------"
		    DB 13,10,"  1. Unpack Rice"
		    DB 13,10,"  2. Pack Rice "
		    DB 13,10,"  3. Proceed to Summary Report "
		    DB 13,10
		    DB 13,10,"  Your choice (1/2/3): $"

	ASK_ITEMNO      DB 13,10,"	Enter ItemNo (1-5)       : R$"
	ASK_WEIGHT      DB 13,10,"	Enter Weight (0.1-4.9)   : $"
	ASK_WEIGHT_P    DB 13,10,"	Enter Weight (S/B)       : $"
	ASK_QTY         DB 13,10,"	Enter Quantity           : $"

	;--FOR INPUT & CALCULATION
	ITEMNO               DB ?
	WEIGHT               DB ?
	QTY                  DB ?
	TOTAL_WEIGHT         DB 0
	ORDER_SUBTOTAL       DW 0
	SERVICE_CHARGE_RATE  DB 6
	SERVICE_CHARGE_TOTAL DW ?
	GRANDTOTAL           DW ?

	A DW ?
	B DW ?

	CASHSTR LABEL BYTE
	MAXN DB 7
	ACTN DB ?
	ACTCASHSTR DB 7 DUP(0)

	DECIMAL DB 0
	DIGIT   DW 0
	CASH    DW 0
	CHANGE  DW 0

	BLANK    DB " "
	BLANK_2  DB "  $"
	BLANK_4  DB "    $"
	BLANK_5  DB "     $"
	BLANK_7  DB "       $"
	BLANK_15 DB "               $"
	BLANK_36 DB "                                    $"

	;--CART
	ORDER_COUNT DB 0
	ORDER_ID    DB 110

	ORDER_UNPACK_OR_PACK DB 100 DUP(?)
	ORDER_ITEM           DB 100 DUP(?)
	ORDER_WEIGHT         DB 100 DUP(?)
	ORDER_QTY            DB 100 DUP(?)

	CART_TITLE        DB 13,10
		          DB 13,10,"                               ---------------"
		          DB 13,10,"                                Order Details"
		          DB 13,10,"                               ---------------$"
	CART_HEADER_TITLE DB 13,10
		          DB 13,10,"               --------------------------------------------------"
		          DB 13,10,"               NO.   ITEM NAME         WEIGHT       QTY   "
		          DB 13,10,"               --------------------------------------------------$"
	CART_BORDER_1     DB 13,10
		          DB 13,10,"               --------------------------------------------------"
		          DB 13,10,"                                      SUBTOTAL           $"
	CART_BORDER_2     DB 13,10,"                                    =============================$"
	CART_BORDER_3     DB 13,10
		          DB 13,10
		          DB 13,10,"  [1] Continue Order"
		          DB 13,10,"  [2] Proceed to Payment"
		          DB 13,10,"  [3] Cancel Order"
		          DB 13,10
		          DB 13,10,"  Your choice (1/2/3) : $"

	;--RICE NAME 
	FR_NAME DB "Fragrant of Rice$"
	BA_NAME DB "Basmati Rice    $"
	BR_NAME DB "Brown Rice      $"
	GL_NAME DB "Glutinuous Rice $"
	VE_NAME DB "Rice Vermicelli $"

	;--------------------
	;--PAYMENT VARIABLE--
	;--------------------
	PAYMENT_RECEIPT_HEADER  DB 13,10
				DB 13,10,"                                      \||/           "
				DB 13,10,"                                   -\| o o |/-       "
				DB 13,10,"                                     |  ^  |         "
				DB 13,10,"                                  =============      "
				DB 13,10,"                               --    JASMINE    --   "
				DB 13,10,"                                  =============      "
				DB 13,10
				DB 13,10,"           ===========================================================$"

	PAYMENT_RECEIPT_ORDER_ID     DB 13,10,"           ORDER ID       : $"
	PAYMENT_RECEIPT_DATE         DB 13,10,"           DATE & TIME    : $"
	PAYMENT_RECEIPT_HEADER_END   DB 13,10,"           ===========================================================$"
	PAYMENT_SERVICE_CHARGE_TOTAL DB 13,10,"                                      SERVICE CHARGE 6%  $"
	PAYMENT_LINE_1               DB 13,10,"                                      ---------------------------$"
	PAYMENT_GRAND_TOTAL          DB 13,10,"                                      GRAND TOTAL     RM $"
	PAYMENT_LINE_2               DB 13,10,"                                      ===========================$"
	PAYMENT_CASH                 DB 13,10
				     DB 13,10,"                                      CASH             RM $"
	PAYMENT_CHANGE               DB 13,10,"                                      CHANGE           RM$"
	PAYMENT_THANKS               DB 13,10
				     DB 13,10,"           ==========================================================="
				     DB 13,10,"                       THANK YOU! HOPE YOU HAVE A NICE DAY :)"
				     DB 13,10,"           ===========================================================$"
	PAYMENT_ASK_CONTINUE         DB 13,10,"           Do you want to continue order? (Y/N) $"
	PAYMENT_ASK_CONTINUE_ANS     DB ?

	ERROR_MSG_STR DB "  INVALID INPUT! PLEASE ENTER AGAIN$"

	;----FOR PACK RICE (QTY)  
	TEMP_FR_P_5KG_TOTALSOLD DB 0   ;5kg 
	TEMP_BA_P_1KG_TOTALSOLD DB 0   ;1kg 
	TEMP_BR_P_5KG_TOTALSOLD DB 0   ;5kg
	TEMP_GL_P_5KG_TOTALSOLD DB 0   ;5kg 
	TEMP_VE_P_5KG_TOTALSOLD DB 0   ;5kg 

	;----FOR PACK RICE (QTY)   
	TEMP_FR_P_10KG_TOTALSOLD DB 0  ;10kg 
	TEMP_BA_P_5KG_TOTALSOLD  DB 0  ;5kg 
	TEMP_BR_P_10KG_TOTALSOLD DB 0  ;10kg  
	TEMP_GL_P_10KG_TOTALSOLD DB 0  ;10kg 
	TEMP_VE_P_10KG_TOTALSOLD DB 0  ;10kg 

	;----FOR UNPACK RICE (kg)  
	TEMP_FR_UNP_TOTALSOLD DW 0   ;Fragrant of Rice 100g
	TEMP_BA_UNP_TOTALSOLD DW 0   ;Basmati Rice     100g
	TEMP_BR_UNP_TOTALSOLD DW 0   ;Brown Rice       100g
	TEMP_GL_UNP_TOTALSOLD DW 0   ;Glutinuous Rice  100g
	TEMP_VE_UNP_TOTALSOLD DW 0   ;Rice Vermicelli  100g


	;=========================FOR REPORT====================
	R_SELECT_STR DB 13,10,13,10,' Selection : $'
	R_SELECT DB 0

	FR_RICE_STR DB 13,10,' (R1) Fragrant Rice        $'
	BA_RICE_STR DB 13,10,' (R2) Basmati Rice         $'
	BR_RICE_STR DB 13,10,' (R3) Brown Rice           $'
	GL_RICE_STR DB 13,10,' (R4) Glutinous Rice       $'
	VE_RICE_STR DB 13,10,' (R5) Rice Vermicelli      $'

	;-----share by packed and unpacked, to store digit one's, ten's, hund's, thou's and ten thou's   
	UNIT_CAL_TTHOU   DB 0    
	UNIT_CAL_ONE     DB ?
	UNIT_CAL_TEN     DB ?
	UNIT_CAL_HUND    DB ?
	UNIT_CAL_THOU    DB ?
	UNIT_DECIMAL     DB ?
	CAL_RESULT_PRICE DW 0

	RICE_NUM     DB 1
	STATUS_SUM_R DB ?                   ;P OR U (UNPACKED),T

	P_RICE_BIG_SOLD   DB ?          ;---qty
	P_RICE_SMALL_SOLD DB ?
	SMALL_P_PER_KG    DW ?
	BIG_P_PER_KG      DW ?

	UP_PRICE     DB ?
	UP_RICE_SOLD DW ?

	;----ten use for DW
	TEN_FOR_N_W DW 10

	;--------ask if back to report menu
	BACK_R_SELECT DB 'Y'

	;=====================FOR STOCK REPORT==================
	STOCK_R_MENU  DB 13,10,13,10, "------------------------------------"
		      DB 13,10,"           STOCK REPORT           "
		      DB 13,10,"------------------------------------"
		      DB 13,10,"  1.  Stock Balance "
		      DB 13,10,"  2.  Stock Details"
		      DB 13,10,"  3.  Add Stock Amount "
		      DB 13,10,"  4.  Back to Main Menu "
		      DB 13,10,"  5.  Exit $"

	STOCK_R_RICE_D_HEADER DB 13,10,13,10
			      DB 13,10,'    Type of Rice          Weight On Hold    Number of Packets '
			      DB 13,10,' ---------------------   -----------------  ------------------$'
	
	STOCK_R_RICE_B_HEADER DB 13,10
			      DB 13,10,'    Type of Rice        Total Weight On Hold   '
			      DB 13,10,' -------------------   ----------------------  $'

	STOCK_R_SP_STR    DB 13,10,'         1 kg pack   -      $'
	STOCK_R_MP_STR    DB 13,10,'         5 kg pack   -      $'
	STOCK_R_LP_STR    DB 13,10,'        10 kg pack   -      $'
	STOCK_R_UP_STR    DB 13,10, '        Unpack Rice  -      $'
	TOTAL_ON_HAND_STR DB 13,10,'        -------------------------------- '
			  DB 13,10,  '        TOTAL AMOUNT  :    $'            ;--in kg


	RICE_CODE_SELECT_STR  DB 13,10,13,10,' Enter rice num to view its details :  R$'
	RICE_CODE_MODIFY      DB 13,10,13,10,' Enter rice num for adding : R$'
	RICE_CODE_SELECTION   DB 0
	STOCK_R_WEIGHT_MODIFY DB 13,10,13,10,' Rice weight to add in kg : $'
	STOCK_R_UPDATED_STR   DB 13,10,13,10,' Rice Weight Updated : '
			      DB 13,10,'         $'
	ST_R_CONFIRM_ADD_STR  DB 13,10,13,10," Confirm to add the amount? ('Y' to confirm) >> $"

	BACK_ST_R_MENU DB 13,10,13,10," Back to Stock Report Menu? ('N' to exit) >>  $"

	STATUS_STOCK_R   DB ?            ;Y,N
	STATUS_STOCK_R1  DB ?            ;S,B
	ST_R_CONFIRM_ADD DB ?      	 ;Y,N

	;----empty space use for packed rice
	SPACE_P_STOCK_R DB '               $'

	RICE_WEIGHT_ADD DW 0
	ST_R_INPUT1 DB 0
	ST_R_INPUT2 DB 0
	ST_R_BACK   DB 'N'

	;----FOR SMALL PACK RICE (QTY)  
	FR_SP_ON_HAND DW 650    
	BA_SP_ON_HAND DW 650   
	BR_SP_ON_HAND DW 650   
	GL_SP_ON_HAND DW 650   
	VE_SP_ON_HAND DW 650   

	;----FOR BIG PACK RICE (QTY)   
	FR_BP_ON_HAND DW 620  
	BA_BP_ON_HAND DW 620   
	BR_BP_ON_HAND DW 620   
	GL_BP_ON_HAND DW 620   
	VE_BP_ON_HAND DW 620   

	;----FOR UNPACK RICE (kg) 
	FR_UNP_ON_HAND DW 20000   ;--2000.0kg
	BA_UNP_ON_HAND DW 20000    
	BR_UNP_ON_HAND DW 20000    
	GL_UNP_ON_HAND DW 20000   
	VE_UNP_ON_HAND DW 20000   

	STOCK_ON_HAND_SP  DW ?
	STOCK_ON_HAND_BP  DW ?
	STOCK_ON_HAND_UP  DW ?
	STOCK_ON_HAND_P   DW ?
	NEW_STOCK_ON_HAND DW 0

	;----for store input add weight (STOCK REPORT)
	ST_R_INPUT_W LABEL BYTE
	MAX_ST_R_INPUT_W DB 4
	NUM_ST_R_INPUT_W DB ?
	ACT_ST_R_INPUT_W DB 4 DUP('$')

	INPUT_WEIGHT_POSITION DW 1,10,100


	;==========================FOR SUMMARY REPORT======================

	SUM_R_MENU      DB 13,10,13,10, "------------------------------------"
		        DB 13,10,"       DAILY SUMMARY REPORT          "
		        DB 13,10,"------------------------------------$"
	SUM_R_TRANS_STR DB 13,10,'       Total Transaction : $'
	
	SUM_R_MENU1 DB 13,10,13,10,"  1.  Packed Rice Sold"
		    DB 13,10,"  2.  Unpacked Rice Sold"
		    DB 13,10,"  3.  Total Rice Sold "
		    DB 13,10,"  4.  Exit $"

	SUM_R_P_RICE_TT DB 13,10,13,10,13,10,'                      PACKED RICE         '
			DB 13,10,'                   ----------------       $'
	SUM_R_UP_RICE_TT DB 13,10,13,10,13,10,'                      UNPACKED RICE         '
			 DB 13,10,'                   ------------------       $'
	SUM_R_TOTAL_RICE_TT DB 13,10,13,10,13,10,'                      TOTAL RICE SOLD         '
			    DB 13,10,'                     -----------------       $'
	SUM_R_RICE_HEADER DB 13,10
			  DB 13,10,'    Type of Rice         Weight Sold       Price Earn '
			  DB 13,10,'--------------------    --------------    ------------ $'

	BACK_SUM_R_MENU DB 13,10,13,10," Back to Summary Report Menu? ('N' to exit) >>  $"

	SPACE_P_SUM_R  DB '         $'
	SPACE_UP_SUM_R DB '        $'

	;---for packed in sum report
	P_PRICE1 DW ?                ;--for small packed
	P_PRICE2 DW ?

	;----for total sold weight and price	
	SUM_R_TT_SOLD_W         DW 0
	SUM_R_TT_SOLD_P         DW 0
	SUM_R_TT_SOLD_P_DECIMAL DB 0


.CODE
MAIN PROC

	MOV AX,@DATA
	MOV DS,AX
	MOV COUNT,0

COMPANY_LOGIN:
	
	MOV COUNT,0
	CALL CLEARSCREEN
	MOV AH,09H
	LEA DX,COMPANY
	INT 21H
	
	MOV AH,09H
	LEA DX,LOGINMENU
	INT 21H

	MOV AH,09H
	LEA DX,LOGINSTR1
	INT 21H

	MOV AH,01H
	INT 21H
	SUB AL,48
	MOV LOGINSLEC,AL

	CMP LOGINSLEC,1
	JE LOGIN1
	CMP LOGINSLEC,2
	
	JE LOGIN2_2

	CMP LOGINSLEC,3
	JE  END_SYS
	
	JNE ERROR_MESSAGE_L1

	END_SYS:
		CALL R_SELECT_FIN

		MOV AH,09H
		LEA DX,NL
		INT 21H
 
		MOV AX,4C00H
		INT 21H
	LOGIN2_2:
		CALL CLEARSCREEN
		JMP LOGIN2
	
	ERROR_MESSAGE_L1:
		
		CALL R_DISP_ERROR_MESSAGE
		CALL CLEARSCREEN
		
		JMP COMPANY_LOGIN
	LOGIN1:
		CALL CLEARSCREEN
		MOV IDMAX_LEN,7
		
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,LOGINSTR2
		INT 21H

		MOV AH,0AH
		LEA DX,ID_LIST
		INT 21H

		DEC IDMAX_LEN

		MOV SI,0
		MOV CH,0
		MOV CL,IDMAX_LEN
	
		USER_STAFF:
			MOV AL,IDENTER_DATA[SI]
			CMP AL,LOGINSTAFF[SI]
			JNE J_USER_WRONG
			INC SI
			LOOP USER_STAFF

			JMP CONTINUE_DISPLAY_LOGIN

		J_USER_WRONG:
			JMP USER_WRONG

		CONTINUE_DISPLAY_LOGIN:
		MOV AH,09H
		LEA DX,LOGINSTR4
		INT 21H

		MOV CX,6
		MOV SI,0
		
		CHECK_STAFF_PASSWORD:
			MOV AH,08H
			INT 21H

			CMP AL,' '
			JE CHECK_STAFF_PASSWORD
			CMP AL,08H
			JE CHECK_STAFF_PASSWORD
			CMP AL,09H
			JE CHECK_STAFF_PASSWORD
			MOV STAFF_PASS_ARR[SI],AL
			
			MOV DL,'*'
			MOV AH,02H
			INT 21H

			INC SI
		LOOP CHECK_STAFF_PASSWORD

		MOV SI,0
		MOV CX,6
		VERIFY_STAFF_PASSWORD:

			MOV AL,PASSSTAFF[SI]
			CMP STAFF_PASS_ARR[SI],AL

			JNE J_ERROR_PASSWORD_STAFF

			INC SI
		LOOP VERIFY_STAFF_PASSWORD
		JMP USER_CORRECT

		J_ERROR_PASSWORD_STAFF:
			JMP ERROR_PASSWORD_STAFF
		
		USER_CORRECT:
			CALL CLEARSCREEN
			MOV AH,09H
			LEA DX,NL
			INT 21H

			MOV AH,09H
			LEA DX,NL
			INT 21H

			MOV AH,09H
			LEA DX,SUCCESS_LOGIN
			INT 21H

			MOV AH,09H
			LEA DX,NL
			INT 21H

			MOV AH,09H
			LEA DX,NL
			INT 21H

			JMP INTO_SYSTEM
			
			INTO_SYSTEM:
				CALL CLEARSCREEN
				MOV AH,09H
				LEA DX,SYSTEM_MENU
				INT 21H

				MOV AH,01H
				INT 21H
				SUB AL,48
				MOV LOGINSLEC,AL
				
				CMP LOGINSLEC,1
				JE  J_ORDER
				CMP LOGINSLEC,2
				JE  REPORT
				CMP LOGINSLEC,3
				JNE  MESSAGE
				JMP COMPANY_LOGIN
				
				MESSAGE:
				MOV AH,09H
				LEA DX,NL
				INT 21H

				MOV AH,09H
				LEA DX,ERROR_MSG_1
				INT 21H

				JMP INTO_SYSTEM
				
		J_ORDER:
			CALL ORDER_FN

		REPORT:
			CALL STOCK_REPORT_FN

		COMPANY_LOGIN_4:
			JMP COMPANY_LOGIN
		USER_WRONG:
			CALL CLEARSCREEN
			MOV AH,09H
			LEA DX,ERROR_MSG_2
			INT 21H
			
			MOV AH,01H
			INT 21H
			MOV AGAINSLEC,AL

			CMP AGAINSLEC,'A'
			JE  LOGIN1_1
			CMP AGAINSLEC,'E'
			JE COMPANY_LOGIN_4

			MOV AH,09H
			LEA DX,ERROR_MSG_1
			INT 21H

			JMP USER_WRONG

			LOGIN1_1:
				JMP LOGIN1
		ERROR_PASSWORD_STAFF:
			CALL CLEARSCREEN
			MOV AH,09H
			LEA DX,NL
			INT 21H
			
			ADD COUNT,1
			CMP COUNT,3
			JGE EXCEED_LOGIN_DETECT
			
			MOV AH,09H
			LEA DX,ERROR_MSG_3
			INT 21H
		
			MOV AH,01H
			INT 21H
			MOV AGAINSLEC,AL

			CMP AGAINSLEC,'A'
			JE  LOGIN1_1
			CMP AGAINSLEC,'E'
			JE  COMPANY_LOGIN_3
			
			MOV AH,09H
			LEA DX,ERROR_MSG_1
			INT 21H

			DEC COUNT

			JMP ERROR_PASSWORD_STAFF	
		EXCEED_LOGIN_DETECT:
			CALL CLEARSCREEN
			MOV AH,09H
			LEA DX,NL
			INT 21H

			MOV AH,09H
			LEA DX,FORGETPASSSTR
			INT 21H
	
			MOV AH,01H
			INT 21H
			MOV FORGETSLEC,AL

			CMP FORGETSLEC,'Y'
			JE  CHANGE_PASSWORD
			CMP FORGETSLEC,'N'
			JE  COMPANY_LOGIN_3

			MOV AH,09H
			LEA DX,ERROR_MSG_1
			INT 21H
			
			JMP EXCEED_LOGIN_DETECT

			COMPANY_LOGIN_3:

				JMP COMPANY_LOGIN
			ERROR_PASSWORD_STAFF_1:
				JMP ERROR_PASSWORD_STAFF
			CHANGE_PASSWORD:
				CALL CLEARSCREEN
				MOV AH,09H
				LEA DX,FORGET_PASS
				INT 21H

				MOV IDMAX_LEN,7

				MOV AH,09H
				LEA DX,NL
				INT 21H

				MOV AH,09H
				LEA DX,LOGINSTR2
				INT 21H

				MOV AH,0AH
				LEA DX,ID_LIST
				INT 21H

				DEC IDMAX_LEN

				MOV SI,0
				MOV CH,0
				MOV CL,IDMAX_LEN
	
				CHANGE_USER_STAFF:
			
					MOV AL,IDENTER_DATA[SI]
					CMP AL,LOGINSTAFF[SI]
					JNE CHANGE_PASSWORD_WRONG
					INC SI

				LOOP CHANGE_USER_STAFF
				JMP CONTINUE_CHANGE

				CHANGE_PASSWORD_WRONG:
					MOV AH,09H
					LEA DX,NL
					INT 21H

					MOV AH,09H
					LEA DX,ERROR_MSG_2
					INT 21H
			
					MOV AH,01H
					INT 21H
					MOV AGAINSLEC,AL

					CMP AGAINSLEC,'A'
					JE  CHANGE_PASSWORD
					CMP AGAINSLEC,'E'
					JE COMPANY_LOGIN_3
			
					MOV AH,09H
					LEA DX,ERROR_MSG_1
					INT 21H

					JMP CHANGE_PASSWORD_WRONG

				CONTINUE_CHANGE:

				MOV AH,09H
				LEA DX,PASSSTR1
				INT 21H
	
				MOV CX,6
				MOV SI,0
			CHECK_SECRET_PASSWORD:

				MOV AH,08H
				INT 21H

				CMP AL,' '
				JE CHECK_SECRET_PASSWORD
				CMP AL,08H
				JE CHECK_SECRET_PASSWORD
				CMP AL,09H
				JE CHECK_SECRET_PASSWORD

				MOV SECRET_PASS_ARR[SI],AL
			
				MOV DL,'*'
				MOV AH,02H
				INT 21H

				INC SI
	
			LOOP CHECK_SECRET_PASSWORD

			MOV CX,6
			MOV SI,0

			COMPARE_CHECK_SECRET_PASSWORD:

				MOV AL,SECRET_PASS_ARR[SI]
				CMP AL,SECRETPASS[SI]
				JNE NOT_MATCH_SECRET
				
				INC SI
			LOOP COMPARE_CHECK_SECRET_PASSWORD
			JMP CONTINUE_PASSWORD_CHANGE

			NOT_MATCH_SECRET:
				CALL CLEARSCREEN
				MOV AH,09H
				LEA DX,NOT_MATCH
				INT 21H

				MOV AH,09H
				LEA DX,NL
				INT 21H
	
				JMP COMPANY_LOGIN_3
		
			CONTINUE_PASSWORD_CHANGE:

			MOV AH,09H
			LEA DX, PASSSTR2
			INT 21H

			MOV CX,6
			MOV SI,0
			
			ENTER_CHANGE_PASSWORD:
				
				MOV AH,08H
				INT 21H

				CMP AL,' '
				JE ENTER_CHANGE_PASSWORD
				CMP AL,08H
				JE ENTER_CHANGE_PASSWORD
				CMP AL,09H
				JE ENTER_CHANGE_PASSWORD
				MOV PASSARR1[SI],AL
				MOV COUNT,0

				MOV DL,'*'
				MOV AH,02H
				INT 21H

				INC SI

			LOOP ENTER_CHANGE_PASSWORD

			MOV AH,09H
			LEA DX, PASSSTR3
			INT 21H

			MOV CX,6
			MOV SI,0
			
			REENTER_CHANGE_PASSWORD:
				
				MOV AH,08H
				INT 21H

				CMP AL,' '
				JE REENTER_CHANGE_PASSWORD
				CMP AL,08H
				JE REENTER_CHANGE_PASSWORD
				CMP AL,09H
				JE REENTER_CHANGE_PASSWORD

				MOV PASSARR2[SI],AL
				
				MOV DL,'*'
				MOV AH,02H
				INT 21H

				INC SI

			LOOP REENTER_CHANGE_PASSWORD

			MOV CX,6
			MOV SI,0

			COMPARE_TWO_PASS:

				MOV AL,PASSARR1[SI]
				CMP AL,PASSARR2[SI]
				JNE NOT_MATCH_PASS
				
				INC SI
			LOOP COMPARE_TWO_PASS
			JMP CONTINUE_PASS_CHANGE

			CON_PASS_CHANGE:
			 JMP CONTINUE_PASSWORD_CHANGE

			COMPANY_LOGIN_5:
				JMP COMPANY_LOGIN
			
			NOT_MATCH_PASS:
				
				MOV AH,09H
				LEA DX,NL
				INT 21H

				MOV AH,09H
				LEA DX,PASS_NOT_MATCH
				INT 21H
				
				MOV AH,01H
				INT 21H
				MOV AGAINSLEC,AL

				CMP AGAINSLEC,'A'
				JE  CON_PASS_CHANGE
				CMP AGAINSLEC,'E'
				JE  COMPANY_LOGIN_5
				JMP NOT_MATCH_PASS
				
				MOV AH,09H
				LEA DX,ERROR_MSG_4
				INT 21H
				
				JMP COMPANY_LOGIN_3
			CONTINUE_PASS_CHANGE:

			MOV AH,09H
			LEA DX,PASSSTR4
			INT 21H
	
			MOV AH,01H
			INT 21H
			MOV SURESLEC,AL

			CMP SURESLEC,'Y'
			JE  SURE
			CMP SURESLEC,'N'
			JE  NOT_SURE

			MOV AH,09H
			LEA DX,ERROR_MSG_1
			INT 21H

			JMP CONTINUE_PASS_CHANGE
			
			SURE:
				MOV AH,09H
				LEA DX,CHANGED
				INT 21H

				MOV AH,09H
				LEA DX,NL
				INT 21H

				MOV COUNT,0

				MOV CX,6
				MOV SI,0

			INSERT_CHANGE_PASS:
				MOV AL,PASSARR1[SI]
				MOV PASSSTAFF[SI],AL
				INC SI
			LOOP INSERT_CHANGE_PASS

			JMP COMPANY_LOGIN

			NOT_SURE:
				MOV AH,09H
				LEA DX,ERROR_MSG_4
				INT 21H

				MOV COUNT,0

				JMP COMPANY_LOGIN

				
	LOGIN2:
		CALL CLEARSCREEN
		MOV AH,09H
		LEA DX,RICEMENU
		INT 21H

		MOV AH,09H
		LEA DX,LOGINSTR1
		INT 21H

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV RICESLEC,AL

		CMP RICESLEC,1
		JE  DISPLAY_RICE_MENU1
		CMP RICESLEC,2
		JE  DISPLAY_RICE_MENU2
		CMP RICESLEC,3
		JE  COMPANY_LOGIN_1

		CALL R_DISP_ERROR_MESSAGE

		MOV AH,09H
		LEA DX,NL
		INT 21H

		JMP LOGIN2
	DISPLAY_RICE_MENU1:
		CALL CLEARSCREEN
		MOV AH,09H
		LEA DX,PACK_MENU
		INT 21H

	EXIT:
		MOV AH,09H
		LEA DX,EXITSTR1
		INT 21H

		MOV AH,01H
		INT 21H
		MOV EXITSLEC,AL

		CMP EXITSLEC,'Y'
		JE  COMPANY_LOGIN_1
		CMP EXITSLEC,'N'
		JE  LOGIN2

		MOV AH,09H
		LEA DX,ERROR_MSG_1
		INT 21H
		

		MOV AH,09H
		LEA DX,NL
		INT 21H

		JMP EXIT

		COMPANY_LOGIN_1:
			JMP COMPANY_LOGIN
	DISPLAY_RICE_MENU2:
		CALL CLEARSCREEN
		MOV AH,09H
		LEA DX,UNPACK_MENU
		INT 21H
		
		EXIT2:	
		MOV AH,09H
		LEA DX,EXITSTR1
		INT 21H

		MOV AH,01H
		INT 21H
		MOV EXITSLEC,AL
		
		CMP EXITSLEC,'Y'
		JE  COMPANY_LOGIN_2
		CMP EXITSLEC,'N'
		JE  LOGIN2_1

		CALL R_DISP_ERROR_MESSAGE

		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		JMP EXIT2

		COMPANY_LOGIN_2:
			JMP COMPANY_LOGIN
		LOGIN2_1:
			JMP LOGIN2
	FIN:
	MOV AX,4C00H
	INT 21H

MAIN ENDP

;=========================================================================
;------------------------------------ ORDER ------------------------------
;=========================================================================

ORDER_FN PROC

	ORDER_START:
	MOV ORDER_COUNT,0
	MOV ORDER_SUBTOTAL,0
	CALL CLEAR_TEMP_TOTAL_SOLD

	ORDER:
		;--CLEAR THE SCREEN
		CALL CLEARSCREEN

		;#####################################
		;--------DISPLAY ORDER SUBMENU-------
		;#####################################

		MOV AH,09H
		LEA DX,ORDER_MENU
		INT 21H

		;#####################################
		;------------ACCEPT CHOICE------------
		;#####################################

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV BL,AL

		;--NEW LINE
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;------CMP
		CMP BL,1
		JE UNPACK
		CMP BL,2
		JE PACK

		CMP BL,3
		JE J_SUMMARY_REPORT_FN

		ERROR_MSG:
			CALL R_DISP_ERROR_MESSAGE
			JMP ORDER

	;#################################################################
	;                          [  UNPACK  ]
	;#################################################################

	UNPACK: 
		CALL CLEARSCREEN
		CALL UNPACK_F
		JMP ORDER_CART_CONTINUE

	;#################################################################
	;                           [  PACK  ]
	;#################################################################
	PACK:
		CALL CLEARSCREEN
		CALL PACK_F
		JMP ORDER_CART_CONTINUE

	ORDER_CART_CONTINUE:
				CALL ORDER_CART

				ORDER_CART_CONTINUE_L1:
				;-------------------------------------------
				;--ASK CONTINUE ORDER / PROCEED TO PAYMENT--
				;-------------------------------------------
				MOV AH,09H
				LEA DX,CART_BORDER_3
				INT 21H

				;--INPUT
				MOV AH,01H
				INT 21H
				SUB AL,48

				CMP AL,1
				JE ORDER

				CMP AL,2
				JE PAYMENT

				CMP AL,3
				;--CANCEL ORDER
				JE ORDER_START

				CALL R_DISP_ERROR_MESSAGE
				JMP ORDER_CART_CONTINUE_L1

	;#################################################################
	;                          [  PAYMENT  ]
	;#################################################################
	PAYMENT:
			CALL CLEARSCREEN
			CALL PAYMENT_F

			PAYMENT_ASK_TO_CONTINUE:
					;----------------
					;--ASK CONTINUE--
					;----------------
					MOV AH,09H
					LEA DX,PAYMENT_ASK_CONTINUE
					INT 21H

					MOV AH,01H
					INT 21H
					MOV PAYMENT_ASK_CONTINUE_ANS,AL

					CMP AL,'Y'
					JE J_ORDER_START
					CMP AL,'N'
					JE J_SUMMARY_REPORT_FN

					CALL R_DISP_ERROR_MESSAGE
					JMP PAYMENT_ASK_TO_CONTINUE

				J_ORDER_START:
					JMP ORDER_START
			

	;#################################################################
	;			[ SUMMARY REPORT ]
	;#################################################################
	J_SUMMARY_REPORT_FN:
			CALL SUMMARY_REPORT_FN

RET	
ORDER_FN ENDP


;####################################################################################
;------------------------------------------------------------------------------------
;---------------------             [ UNPACK FUNCTION  ]            ------------------
;------------------------------------------------------------------------------------
;####################################################################################

	UNPACK_F PROC
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV SI,BX
		MOV BL,'U'
		MOV ORDER_UNPACK_OR_PACK[SI],BL

		;#########################################
		;---DISPLAY UNPACK MENU & INPUT CHOICE---
		;#########################################

		MOV AH,09H
		LEA DX,UNPACK_MENU
		INT 21H

		UNPACK_INPUT_1:
				;--STR
				MOV AH,09H
				LEA DX,ASK_ITEMNO
				INT 21H

				MOV AH,01H
				INT 21H
				SUB AL,48
				MOV ITEMNO,AL

				CMP AL,5
				JG INPUT_ERROR_1

				CMP AL,1
				JL INPUT_ERROR_1
				JGE UNPACK_F_CONTINUE

		INPUT_ERROR_1: 
				CALL R_DISP_ERROR_MESSAGE
				JMP UNPACK_INPUT_1

		UNPACK_F_CONTINUE:

		;--STORE TO ARRAY
		MOV ORDER_ITEM[SI],AL

		;###############################
		;-------ASK & INPUT WEIGHT------
		;###############################

		UNPACK_INPUT_2:

		MOV AH,09H
		LEA DX,ASK_WEIGHT 
		INT 21H

		;##################
		;-----INPUT X.X----
		;##################
		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV BL,AL

		MOV AH,02H
		MOV DL,DOT
		INT 21H

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV BH,AL

		MOV AH,09H	
		LEA DX,KG
		INT 21H

		;################
		;----SUM --> XX--
		;################

		MOV AL,BL
		MUL TEN
		ADD AL,BH
		MOV WEIGHT,AL

		CMP AL,49
		JG INPUT_ERROR_2

		CMP AL,1
		JL INPUT_ERROR_2
		JGE CONTINUE_1

		INPUT_ERROR_2:
				CALL R_DISP_ERROR_MESSAGE
				JMP UNPACK_INPUT_2
		
		CONTINUE_1:

		;--STORE TO ARRAY
		MOV ORDER_WEIGHT[SI],AL

		;###############################
		;--------ASK & INPUT QTY--------
		;###############################

		UNPACK_INPUT_3:

		MOV AH,09H
		LEA DX,ASK_QTY
		INT 21H
		
		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV QTY,AL

		CMP AL,9
		JG INPUT_ERROR_3

		CMP AL,1
		JL INPUT_ERROR_3
		JGE CONTINUE_2

		INPUT_ERROR_3:
				CALL R_DISP_ERROR_MESSAGE
				JMP UNPACK_INPUT_3

		CONTINUE_2:

		;--STORE TO ARRAY
		MOV ORDER_QTY[SI],AL

		CALL UNPACK_PRICE_CALCULATION

		;#######################
		;----TOP UP SUBTOTAL----
		;#######################

		MOV AX,ORDER_SUBTOTAL
		ADD AX,BX
		MOV ORDER_SUBTOTAL,AX

		INC ORDER_COUNT

	RET
	UNPACK_F ENDP


;####################################################################################
;------------------------------------------------------------------------------------
;----------------------             [ PACK FUNCTION  ]            -------------------
;------------------------------------------------------------------------------------
;####################################################################################

	PACK_F PROC
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV SI,BX
		MOV BL,'P'
		MOV ORDER_UNPACK_OR_PACK[SI],BL

		;-----------------
		;--DISPLAY MENU--
		;-----------------
		MOV AH,09H
		LEA DX,PACK_MENU
		INT 21H

		;----------------
		;--ASK ITEM NO--
		;----------------

		PACK_INPUT_1:

		MOV AH,09H
		LEA DX,ASK_ITEMNO
		INT 21H

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV ITEMNO,AL

		CMP AL,5
		JG ERROR_INPUT_4

		CMP AL,1
		JL ERROR_INPUT_4
		JGE PACK_CONTINUE_1

		ERROR_INPUT_4:
				CALL R_DISP_ERROR_MESSAGE
				JMP PACK_INPUT_1

		PACK_CONTINUE_1:

		;--STORE TO ARRAY
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV SI,BX
		MOV ORDER_ITEM[SI],AL

		;------------------
		;--  ASK WEIGHT  --
		;------------------

		PACK_INPUT_2:

		MOV AH,09H
		LEA DX,ASK_WEIGHT_P
		INT 21H

		MOV AH,01H
		INT 21H
		MOV WEIGHT,AL

		CMP AL,'S'
		JE PACK_CONTINUE_2

		CMP AL,'B'
		JNE ERROR_INPUT_5
		JE PACK_CONTINUE_2

		ERROR_INPUT_5:
				CALL R_DISP_ERROR_MESSAGE
				JMP PACK_INPUT_2

		PACK_CONTINUE_2:

		;--STORE TO ARRAY
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV SI,BX
		MOV ORDER_WEIGHT[SI],AL

		;---------------
		;--  ASK QTY  --
		;---------------

		PACK_INPUT_3:

		MOV AH,09H
		LEA DX,ASK_QTY
		INT 21H

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV QTY,AL

		CMP AL,9
		JG ERROR_INPUT_6

		CMP AL,1
		JL ERROR_INPUT_6
		JGE PACK_CONTINUE_3

		ERROR_INPUT_6:
				CALL R_DISP_ERROR_MESSAGE
				JMP PACK_INPUT_3

		PACK_CONTINUE_3:

		;--STORE TO ARRAY
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV SI,BX
		MOV ORDER_QTY[SI],AL

		CALL PACK_PRICE_CALCULATION

		;----TOP UP SUBTOTAL
		MOV AX,ORDER_SUBTOTAL
		ADD AX,BX
		MOV ORDER_SUBTOTAL,AX

		INC ORDER_COUNT
	RET
	PACK_F ENDP

;####################################################################################
;------------------------------------------------------------------------------------
;--------------------             [ PAYMENT FUNCTION  ]            ------------------
;------------------------------------------------------------------------------------
;####################################################################################

	PAYMENT_F PROC
			;---------------
			;--HEADER PART--
			;---------------

			RECEIPT_HEADER:
				;--------------------------
				;--DISPLAY RECEIPT HEADER--
				;--------------------------
				MOV AH,09H
				LEA DX,PAYMENT_RECEIPT_HEADER
				INT 21H
				
				;--------------------
				;--DISPLAY ORDER ID--
				;--------------------
				MOV AH,09H
				LEA DX,PAYMENT_RECEIPT_ORDER_ID
				INT 21H

				;--XXX
				MOV BL,ORDER_ID
				MOV BH,0
				CALL ORDER_DIGIT_3

				;-----------------------
				;--DISPLAY DATE & TIME--
				;-----------------------
				MOV AH,09H
				LEA DX,PAYMENT_RECEIPT_DATE
				INT 21H

				CALL DISPLAY_DATE
				
				MOV AH,09H
				LEA DX,BLANK_2
				INT 21H

				CALL DISPLAY_TIME

				MOV AH,09H
				LEA DX,PAYMENT_RECEIPT_HEADER_END
				INT 21H

				;MOV AH,09H
				;LEA DX,NL
				;INT 21H

				MOV AH,09H
				LEA DX,CART_HEADER_TITLE
				INT 21H

			RECEIPT_CART:
				;-----------------------
				;-- DISPLAY CART ITEM --
				;-----------------------
		
				MOV SI,0
				MOV BL,ORDER_COUNT
				MOV BH,0
				MOV CX,BX
				ORDER_CART_L2:
						CALL ORDER_CART_ITEM

						INC SI

				LOOP ORDER_CART_L2
	
				;-----------------------
				;--DISPLAY CART BORDER--
				;-----------------------

				MOV AH,09H
				LEA DX,CART_BORDER_1
				INT 21H
			
				;--------------------
				;--DISPLAY SUBTOTAL--
				;--------------------
				MOV AX,ORDER_SUBTOTAL
				MOV BL,TEN
				MOV BH,0
				MUL BX 
				MOV BX,AX
				CALL ORDER_DISPLAY_DIGIT_3_2

				;-------------------------------
				;-----DISPLAY SERVICE CHARGE----
				;-------------------------------	
				MOV AH,09H
				LEA DX,PAYMENT_SERVICE_CHARGE_TOTAL
				INT 21H

				CALL PAYMENT_CAL_SERVICE_CHARGE
				CALL ORDER_DISPLAY_DIGIT_3_2

				;-----------------------
				;--DISPLAY GRAND TOTAL--
				;-----------------------
				MOV AH,09H
				LEA DX,PAYMENT_LINE_1
				INT 21H

				MOV AH,09H
				LEA DX,PAYMENT_GRAND_TOTAL
				INT 21H

				MOV AL,10
				MOV AH,0
				MUL ORDER_SUBTOTAL
				MOV BX,AX
			
				XOR DX,DX
				MOV AX,SERVICE_CHARGE_TOTAL
				MOV CL,TEN
				MOV CH,0
				DIV CX
				
				ADD BX,AX
				MOV GRANDTOTAL,BX
				
				CALL ORDER_DISPLAY_DIGIT_3_2

				;------------
				;--GET CASH--
				;------------

				PAYMENT_ASK_CASH:

						MOV AH,09H
						LEA DX,PAYMENT_LINE_2
						INT 21H

						MOV AH,09H
						LEA DX,PAYMENT_CASH
						INT 21H

						CALL GET_CASH_INPUT

						CMP AX,GRANDTOTAL
						JGE PAYMENT_CONTINUE

						;--DISPLAY ERROR MSG
						MOV AH,09H
						LEA DX,BLANK_36
						INT 21H

						MOV AH,09H
						LEA DX,ERROR_MSG_STR
						INT 21H

				JMP PAYMENT_ASK_CASH
				
				PAYMENT_CONTINUE:

				;----------
				;--CHANGE--
				;----------
				MOV AH,09H
				LEA DX,PAYMENT_CHANGE
				INT 21H

				CALL ROUND_CHANGE

				;--------------
				;--THANKS MSG--
				;--------------
				MOV AH,09H
				LEA DX,PAYMENT_THANKS
				INT 21H

				;----------------
				;--UPDATE SALES--
				;----------------
				CALL PAYMENT_UPDATE_TOTAL_SOLD

				INC ORDER_ID
	RET
	PAYMENT_F ENDP

;##############################################################################################
;------------------                  UNPACK CALCULATION               ------------------------
;##############################################################################################
	
	UNPACK_PRICE_CALCULATION PROC

		;###############################
		;----------CAL WEIGHT-----------
		;###############################

		MOV AL,QTY

		MUL WEIGHT
		MOV TOTAL_WEIGHT,AL
		MOV AH,0


		;###############################
		;-----------CMP ITEMNO----------
		;###############################
		MOV CL,QTY
		MOV BL,ITEMNO
		CMP BL,1
		JE UNP_FR_CAL_PRICE
		
		CMP BL,2
		JE UNP_BA_CAL_PRICE

		CMP BL,3
		JE UNP_BR_CAL_PRICE

		CMP BL,4
		JE UNP_GL_CAL_PRICE
		JNE UNP_VE_CAL_PRICE
 

		UNP_FR_CAL_PRICE:
				;---0.50$
				MOV BL,FR_100G_PRICE
				ADD TEMP_FR_UNP_TOTALSOLD,AX
				JMP ORDER_CAL_UNPACK_PRICE	

		UNP_BA_CAL_PRICE:
				;---1.00$
				MOV BL,BA_100G_PRICE
				ADD TEMP_BA_UNP_TOTALSOLD,AX
				JMP ORDER_CAL_UNPACK_PRICE

		UNP_BR_CAL_PRICE:
				;---0.60$
				MOV BL,BR_100G_PRICE
				ADD TEMP_BR_UNP_TOTALSOLD,AX
				JMP ORDER_CAL_UNPACK_PRICE

		UNP_GL_CAL_PRICE:
				;---0.60$
				MOV BL,GL_100G_PRICE
				ADD TEMP_GL_UNP_TOTALSOLD,AX
				JMP ORDER_CAL_UNPACK_PRICE

		UNP_VE_CAL_PRICE:
				;---0.60$
				MOV BL,VE_100G_PRICE
				ADD TEMP_VE_UNP_TOTALSOLD,AX
				JMP ORDER_CAL_UNPACK_PRICE

		ORDER_CAL_UNPACK_PRICE:
					MOV AL,BL
					MOV AH,0
					MUL TOTAL_WEIGHT
					MOV BX,AX

	RET
	UNPACK_PRICE_CALCULATION ENDP



;##############################################################################################
;------------------                    PACK CALCULATION               ------------------------
;##############################################################################################
	
	PACK_PRICE_CALCULATION PROC

			;--------------------
			;--CMP TYPE OF RICE--
			;--------------------
			MOV BL,ITEMNO
			CMP BL,1
			JE ORDER_PACK_FR_PRICE

			CMP BL,2
			JE ORDER_PACK_BA_PRICE

			CMP BL,3
			JE ORDER_PACK_BR_PRICE

			CMP BL,4
			JE ORDER_PACK_GL_PRICE
			JNE ORDER_PACK_VE_PRICE

			ORDER_PACK_FR_PRICE:
						MOV BL,WEIGHT
						CMP BL,'S'
						JE CAL_FR_5KG_PRICE       ;--SMALL-->  5KG
						JNE CAL_FR_10KG_PRICE     ;---BIG---> 10KG
			ORDER_PACK_BA_PRICE:
						MOV BL,WEIGHT
						CMP BL,'S'
						JE CAL_BA_1KG_PRICE      ;--SMALL-->  1KG
						JNE CAL_BA_5KG_PRICE     ;---BIG--->  5KG
			ORDER_PACK_BR_PRICE:
						MOV BL,WEIGHT
						CMP BL,'S'
						JE CAL_BR_5KG_PRICE       ;--SMALL-->  5KG
						JNE CAL_BR_10KG_PRICE     ;---BIG---> 10KG
			ORDER_PACK_GL_PRICE:
						MOV BL,WEIGHT
						CMP BL,'S'
						JE CAL_GL_5KG_PRICE       ;--SMALL-->  5KG
						JNE CAL_GL_10KG_PRICE     ;---BIG---> 10KG
			ORDER_PACK_VE_PRICE:
						MOV BL,WEIGHT
						CMP BL,'S'
						JE CAL_VE_5KG_PRICE       ;--SMALL-->  5KG
						JNE CAL_VE_10KG_PRICE     ;---BIG---> 10KG

			CAL_FR_5KG_PRICE:
						MOV ORDER_WEIGHT[SI],50
						MOV BX,FR_5KG_PRICE
						JMP PACK_PRICE_CALCULATION_1

			CAL_FR_10KG_PRICE:
						MOV ORDER_WEIGHT[SI],100
						MOV BX,FR_10KG_PRICE
						JMP PACK_PRICE_CALCULATION_2

			CAL_BA_5KG_PRICE:
						MOV ORDER_WEIGHT[SI],50
						MOV BX,BA_5KG_PRICE
						JMP PACK_PRICE_CALCULATION_3

			CAL_BA_1KG_PRICE:
						MOV ORDER_WEIGHT[SI],10
						MOV BX,BA_1KG_PRICE
						JMP PACK_PRICE_CALCULATION_4

			CAL_BR_5KG_PRICE:
						MOV ORDER_WEIGHT[SI],50
						MOV BX,BR_5KG_PRICE
						JMP PACK_PRICE_CALCULATION_5

			CAL_BR_10KG_PRICE:
						MOV ORDER_WEIGHT[SI],100
						MOV BX,BR_10KG_PRICE
						JMP PACK_PRICE_CALCULATION_6

			CAL_GL_5KG_PRICE:
						MOV ORDER_WEIGHT[SI],50
						MOV BX,GL_5KG_PRICE
						JMP PACK_PRICE_CALCULATION_7

			CAL_GL_10KG_PRICE:
						MOV ORDER_WEIGHT[SI],100
						MOV BX,GL_10KG_PRICE
						JMP PACK_PRICE_CALCULATION_8


			CAL_VE_5KG_PRICE:
						MOV ORDER_WEIGHT[SI],50
						MOV BX,VE_5KG_PRICE
						JMP PACK_PRICE_CALCULATION_9

			CAL_VE_10KG_PRICE:
						MOV ORDER_WEIGHT[SI],100
						MOV BX,VE_10KG_PRICE
						JMP PACK_PRICE_CALCULATION_10

			MOV AL,QTY

			PACK_PRICE_CALCULATION_1:
						ADD TEMP_FR_P_5KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_2:
						ADD TEMP_FR_P_10KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_3:
						ADD TEMP_BA_P_5KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_4:
						ADD TEMP_BA_P_1KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_5:
						ADD TEMP_BR_P_5KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_6:
						ADD TEMP_BR_P_10KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_7:
						ADD TEMP_GL_P_5KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_8:
						ADD TEMP_GL_P_10KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_9:
						ADD TEMP_VE_P_5KG_TOTALSOLD,AL
						JMP ORDER_CAL_PACK_PRICE
			PACK_PRICE_CALCULATION_10:
						ADD TEMP_VE_P_10KG_TOTALSOLD,AL

			ORDER_CAL_PACK_PRICE:
						MOV AL,QTY
						MOV AH,0
						MUL BX      ;--> PRICE 
						MOV BX,AX
					

	RET
	PACK_PRICE_CALCULATION ENDP

;##############################################################################################
;-----------------                 SERVICE CHARGE CALCULATION                 -----------------
;##############################################################################################

	PAYMENT_CAL_SERVICE_CHARGE PROC
				;--MUL SUBTOTAL & SST 10 %
				MOV AL,SERVICE_CHARGE_RATE
				MOV AH,0
				MUL ORDER_SUBTOTAL
				MOV SERVICE_CHARGE_TOTAL,AX

				XOR DX,DX
				MOV AX,SERVICE_CHARGE_TOTAL
				MOV BX,100
				DIV BX
				MOV A,AX
				MOV B,DX
		
				MOV AX,B
				DIV TEN
				MOV BX,AX

				CMP BH,5
				JGE L1
				JL L2

				L1:
					CMP BL,9
					JE L3
					JNE L4

				;--XX.95
				L3:
					MOV AX,A
					DIV TEN
					MOV CX,AX

					CMP CH,9
					JE L5
					JNE L6

				;--X9.95
				L5:
					ADD SERVICE_CHARGE_TOTAL,1000
					MOV AX,B
					SUB SERVICE_CHARGE_TOTAL,AX
					MOV AL,CH
					MUL HUNDRED
					SUB SERVICE_CHARGE_TOTAL,AX			
					JMP CONTINUE				

				;--X8.95
				L6:
					ADD SERVICE_CHARGE_TOTAL,100
					MOV BX,B
					SUB SERVICE_CHARGE_TOTAL,BX
					JMP CONTINUE

				;--XX.85
				L4:
					ADD SERVICE_CHARGE_TOTAL,10

				;--XX.X0
				L2:			
					MOV AL,BH
					MOV AH,0
					SUB SERVICE_CHARGE_TOTAL,AX
			
				CONTINUE:
					XOR DX,DX
					MOV AX,SERVICE_CHARGE_TOTAL
					MOV CL,10
					MOV CH,0
					DIV CX
					MOV BX,AX
	
	RET
	PAYMENT_CAL_SERVICE_CHARGE ENDP

;##############################################################################################
;-------------------                      ROUND CHANGE                 ------------------------
;##############################################################################################

	ROUND_CHANGE PROC
				MOV AX,CASH
				SUB AX,GRANDTOTAL
				MOV CHANGE,AX

				XOR DX,DX
				MOV BL,HUNDRED
				MOV BH,0
				DIV BX
				MOV A,AX
				MOV B,DX

				MOV AX,B
				DIV TEN
				MOV BX,AX

				CMP BH,5
				JG ROUND_CHANGE_ADD_1
				JL ROUND_CHANGE_ZERO
				JMP ROUND_CHANGE_DISPLAY

				;--XXX.X5
				ROUND_CHANGE_ADD_1:
						CMP BL,9
						JE ROUND_CHANGE_ADD_2
						JNE ROUND_CHANGE_ADD_5

				;--XXX.95			
				ROUND_CHANGE_ADD_2:
						MOV AX,A
						DIV HUNDRED
						MOV CX,AX

						MOV AL,CH
						MOV AH,0
						DIV TEN
						MOV DX,AX

						CMP DH,9
						JE ROUND_CHANGE_ADD_3
						JNE ROUND_CHANGE_ADD_6

				;--XX9.95
				ROUND_CHANGE_ADD_3:
						CMP DL,9
						JE ROUND_CHANGE_ADD_4
						JNE ROUND_CHANGE_ADD_7

				;--X99.95
				ROUND_CHANGE_ADD_4:
						ADD CHANGE,10000
						MOV AX,B
						SUB CHANGE,AX
						MOV AL,CH
						MUL HUNDRED
						SUB CHANGE,AX
						JMP ROUND_CHANGE_DISPLAY

				;--XXX.45
				ROUND_CHANGE_ADD_5:
						ADD CHANGE,10
						MOV AL,BH
						MOV AH,0
						SUB CHANGE,AX
						JMP ROUND_CHANGE_DISPLAY

				;--XX4.95
				ROUND_CHANGE_ADD_6:
						ADD CHANGE,100
						MOV AX,B
						SUB CHANGE,AX
						JMP ROUND_CHANGE_DISPLAY

				;--X49.95
				ROUND_CHANGE_ADD_7:
						ADD CHANGE,1000
						MOV AX,B
						SUB CHANGE,AX
						MOV AL,DH
						MUL HUNDRED
						SUB CHANGE,AX
						JMP ROUND_CHANGE_DISPLAY

				;--XXX.X4
				ROUND_CHANGE_ZERO:
						MOV AL,BH
						MOV AH,0
						SUB CHANGE,AX

				ROUND_CHANGE_DISPLAY:
						MOV BX,CHANGE
						CALL ORDER_DISPLAY_DIGIT_3_2

						
	RET
	ROUND_CHANGE ENDP


;##############################################################################################
;-------------------                   INPUT XXX.XX                         -------------------
;##############################################################################################

	GET_CASH_INPUT PROC
			
			MOV AH,0AH
			LEA DX,CASHSTR
			INT 21H

			MOV AH,09H
			LEA DX,NL
			INT 21H

			MOV BL,ACTN
			MOV BH,0
			MOV DI,BX

			CASH_INPUT_L1:
				DEC DI

				MOV BL,ACTCASHSTR[DI]
				SUB BL,48
				MOV DECIMAL,BL
				INT 21H

				DEC DI

				MOV BL,ACTCASHSTR[DI]
				SUB BL,48
				MOV AL,BL
				MOV AH,0
				MUL TEN
				ADD DECIMAL,AL

			CASH_INPUT_L2:
				MOV BL,ACTN
				SUB BL,4
				MOV BH,0
				MOV DI,BX

				CMP DI,1
				JE CASH_INPUT_L3
				CMP DI,2
				JE CASH_INPUT_L4

			CASH_INPUT_L3:
				MOV AL,ACTCASHSTR[DI]
				MOV AH,0
				SUB AX,48
				MOV DIGIT,AX

				DEC DI
				MOV AL,ACTCASHSTR[DI]
				MOV AH,0
				SUB AX,48
				MUL TEN
				MOV CL,AL
				MOV CH,0
				ADD DIGIT,CX
				JMP CASH_INPUT_CONTINUE

			CASH_INPUT_L4:
				MOV AL,ACTCASHSTR[DI]
				MOV AH,0
				SUB AX,48
				MOV DIGIT,AX

				DEC DI
				MOV AL,ACTCASHSTR[DI]
				MOV AH,0
				SUB AX,48
				MUL TEN
				MOV CL,AL
				MOV CH,0
				ADD DIGIT,CX

				DEC DI
				MOV AL,ACTCASHSTR[DI]
				MOV AH,0
				SUB AX,48
				MUL HUNDRED
				ADD DIGIT,AX

			CASH_INPUT_CONTINUE:
				MOV AX,DIGIT
				MOV BL,HUNDRED
				MOV BH,0
				MUL BX
				MOV BL,DECIMAL
				MOV BH,0
				ADD AX,BX

				MOV CASH,AX

	RET
	GET_CASH_INPUT ENDP

;##############################################################################################
;--------------                   UPDATE SALES AFTER DONE PAYMENT            ------------------   
;##############################################################################################

	PAYMENT_UPDATE_TOTAL_SOLD PROC
					;------TOP UP PACK TOTAL SOLD-----   
					;-----------SMALL PACK------------
					MOV BL,TEMP_FR_P_5KG_TOTALSOLD
					ADD FR_P_5KG_TOTALSOLD,BL

					MOV BL,TEMP_BA_P_1KG_TOTALSOLD
					ADD BA_P_1KG_TOTALSOLD,BL

					MOV BL,TEMP_BR_P_5KG_TOTALSOLD
					ADD BR_P_5KG_TOTALSOLD,BL

					MOV BL,TEMP_GL_P_5KG_TOTALSOLD
					ADD GL_P_5KG_TOTALSOLD,BL

					MOV BL,TEMP_VE_P_5KG_TOTALSOLD
					ADD VE_P_5KG_TOTALSOLD,BL

					;-----------BIG PACK------------
					MOV BL,TEMP_FR_P_10KG_TOTALSOLD
					ADD FR_P_10KG_TOTALSOLD,BL

					MOV BL,TEMP_BA_P_5KG_TOTALSOLD
					ADD BA_P_5KG_TOTALSOLD,BL

					MOV BL,TEMP_BR_P_10KG_TOTALSOLD
					ADD BR_P_10KG_TOTALSOLD,BL

					MOV BL,TEMP_GL_P_10KG_TOTALSOLD
					ADD GL_P_10KG_TOTALSOLD,BL

					MOV BL,TEMP_VE_P_10KG_TOTALSOLD
					ADD VE_P_10KG_TOTALSOLD,BL

					;------TOP UP UNPACK TOTAL SOLD-----  
					MOV CX,TEMP_FR_UNP_TOTALSOLD
					ADD FR_UNP_TOTALSOLD,CX

					MOV CX,TEMP_BA_UNP_TOTALSOLD
					ADD BA_UNP_TOTALSOLD,CX

					MOV CX,TEMP_BR_UNP_TOTALSOLD
					ADD BR_UNP_TOTALSOLD,CX

					MOV CX,TEMP_GL_UNP_TOTALSOLD
					ADD GL_UNP_TOTALSOLD,CX

					MOV CX,TEMP_VE_UNP_TOTALSOLD
					ADD VE_UNP_TOTALSOLD,CX

	RET
	PAYMENT_UPDATE_TOTAL_SOLD ENDP

;##############################################################################################
;---------------------                   CLEAR TEMP TOTALSOLD            ----------------------   
;##############################################################################################

	CLEAR_TEMP_TOTAL_SOLD PROC
					;-----PACK TOTAL SOLD-----   
					;-----------SMALL PACK------------
					MOV TEMP_FR_P_5KG_TOTALSOLD,0
					MOV TEMP_BA_P_1KG_TOTALSOLD,0
					MOV TEMP_BR_P_5KG_TOTALSOLD,0
					MOV TEMP_GL_P_5KG_TOTALSOLD,0
					MOV TEMP_VE_P_5KG_TOTALSOLD,0
			
					;-----------BIG PACK------------
					MOV TEMP_FR_P_10KG_TOTALSOLD,0
					MOV TEMP_BA_P_5KG_TOTALSOLD,0
					MOV TEMP_BR_P_10KG_TOTALSOLD,0
					MOV TEMP_GL_P_10KG_TOTALSOLD,0
					MOV TEMP_VE_P_10KG_TOTALSOLD,0

					;------TOP UP UNPACK TOTAL SOLD-----  
					MOV TEMP_FR_UNP_TOTALSOLD,0
					MOV TEMP_BA_UNP_TOTALSOLD,0
					MOV TEMP_BR_UNP_TOTALSOLD,0
					MOV TEMP_GL_UNP_TOTALSOLD,0
					MOV TEMP_VE_UNP_TOTALSOLD,0

	RET
	CLEAR_TEMP_TOTAL_SOLD ENDP

;------------------------------------------------------------------------------------
;---------------------            [ DISPLAY XXX.XX  ]          ----------------------
;------------------------------------------------------------------------------------

	ORDER_DISPLAY_DIGIT_3_2 PROC

		;##########################
		;------DISPLAY XXX.XX------
		;##########################
		;--XXXXX

		ORDER_DISPLAY_DIGIT_L1:
					XOR DX,DX
					XOR AX,AX
					XOR CX,CX

					MOV AX,BX
					MOV BL,HUNDRED
					MOV BH,0
					DIV BX
					MOV A,AX
					MOV B,DX

					MOV AX,A
					DIV HUNDRED
					MOV BX,AX

					MOV AL,BH
					MOV AH,0
					DIV TEN
					MOV CX,AX

					CMP BL,0
					JE ORDER_DISPLAY_DIGIT_L2
					JNE ORDER_DISPLAY_DIGIT_L3
		;--' 'XX.XX
		ORDER_DISPLAY_DIGIT_L2:
					MOV AH,02H
					MOV DL,BLANK
					INT 21H
					JMP ORDER_DISPLAY_DIGIT_L4

		;--XXX.XX
		ORDER_DISPLAY_DIGIT_L3:
					MOV AH,02H
					MOV DL,BL
					ADD DL,30H
					INT 21H	
					JMP ORDER_DISPLAY_DIGIT_L6

		ORDER_DISPLAY_DIGIT_L4:
					CMP CL,0
					JE ORDER_DISPLAY_DIGIT_L5
					JNE ORDER_DISPLAY_DIGIT_L6

		;--' '' 'X.XX
		ORDER_DISPLAY_DIGIT_L5:
					MOV AH,02H
					MOV DL,BLANK
					INT 21H

					CMP CH,0
					JE ORDER_DISPLAY_DIGIT_L8
					JNE ORDER_DISPLAY_DIGIT_L7

		;--' 'XX.XX
		ORDER_DISPLAY_DIGIT_L6:
					MOV AH,02H
					MOV DL,CL
					ADD DL,30H
					INT 21H
					JMP ORDER_DISPLAY_DIGIT_L7	

		;--0.XX
		ORDER_DISPLAY_DIGIT_L8:
					MOV AH,02H
					MOV DL,ZERO
					ADD DL,30H
					INT 21H	
					JMP ORDER_DISPLAY_DIGIT_L9

		;--X.XX
		ORDER_DISPLAY_DIGIT_L7:
					MOV AH,02H
					MOV DL,CH
					ADD DL,30H
					INT 21H	

		;-.XX
		ORDER_DISPLAY_DIGIT_L9:
					MOV AH,02H
					MOV DL,DOT
					INT 21H	

					MOV AX,B
					DIV TEN
					MOV CX,AX

					MOV AH,02H
					MOV DL,CL
					ADD DL,30H
					INT 21H	

					MOV AH,02H
					MOV DL,CH
					ADD DL,30H
					INT 21H	

	RET
	ORDER_DISPLAY_DIGIT_3_2 ENDP

;------------------------------------------------------------------------------------
;---------------------             [ DISPLAY XXX  ]          ------------------------
;------------------------------------------------------------------------------------

	ORDER_DIGIT_3 PROC
					MOV AX,BX
					DIV HUNDRED
					MOV BX,AX

					MOV AH,02H
					MOV DL,BL                  
					ADD DL,30H
					INT 21H

					MOV AL,BH
					MOV AH,0
					DIV TEN
					MOV CX,AX

					MOV AH,02H
					MOV DL,CL
					ADD DL,30H
					INT 21H

					MOV AH,02H
					MOV DL,CH
					ADD DL,30H
					INT 21H

	RET
	ORDER_DIGIT_3 ENDP


;------------------------------------------------------------------------------------
;-------------------           [ DISPLAY RICE NAME  ]          ----------------------
;------------------------------------------------------------------------------------

	ORDER_DISPLAY_RICE_NAME PROC

				CMP BL,1
				JE DISPLAY_FR_NAME

				CMP BL,2
				JE DISPLAY_BA_NAME

				CMP BL,3
				JE DISPLAY_BR_NAME

				CMP BL,4
				JE DISPLAY_GL_NAME

				;--DISPLAY_VE_NAME
				MOV AH,09H
				LEA DX,VE_NAME
				INT 21H

				JMP ORDER_DISPLAY_RICE_NAME_END


		DISPLAY_FR_NAME:
				MOV AH,09H
				LEA DX,FR_NAME
				INT 21H

		JMP ORDER_DISPLAY_RICE_NAME_END


		DISPLAY_BA_NAME:
				MOV AH,09H
				LEA DX,BA_NAME
				INT 21H

		JMP ORDER_DISPLAY_RICE_NAME_END


		DISPLAY_BR_NAME:
				MOV AH,09H
				LEA DX,BR_NAME
				INT 21H

		JMP ORDER_DISPLAY_RICE_NAME_END


		DISPLAY_GL_NAME:
				MOV AH,09H
				LEA DX,GL_NAME
				INT 21H

		JMP ORDER_DISPLAY_RICE_NAME_END

		ORDER_DISPLAY_RICE_NAME_END:
						RET
						ORDER_DISPLAY_RICE_NAME ENDP

;------------------------------------------------------------------------------------
;-------------------              [ DISPLAY WEIGHT  ]          ----------------------
;------------------------------------------------------------------------------------

	ORDER_DISPLAY_WEIGHT PROC
				MOV AL,BL
				MOV AH,0

				DIV TEN
				MOV BX,AX
	
				;--XX.X
				CMP BL,TEN
				JE DISPLAY_TEN

				MOV AH,02H
				MOV DL,BLANK
				INT 21H
			
				MOV AH,02H
				MOV DL,BL
				ADD DL,30H
				INT 21H

				JMP ORDER_DISPLAY_WEIGHT_END

		DISPLAY_TEN:
				MOV AL,TEN
				MOV AH,0

				DIV TEN
				MOV BX,AX

				MOV AH,02H
				MOV DL,BL
				ADD DL,30H
				INT 21H

				MOV AH,02H
				MOV DL,BH
				ADD DL,30H
				INT 21H
	
		ORDER_DISPLAY_WEIGHT_END:
					MOV AH,02H
					MOV DL,DOT
					INT 21H

					MOV AH,02H
					MOV DL,BH
					ADD DL,30H
					INT 21H

					MOV AH,09H
					LEA DX,KG
					INT 21H

					RET
					ORDER_DISPLAY_WEIGHT ENDP




;------------------------------------------------------------------------------------
;-----------------            [ DISPLAY ORDER CART ITEM  ]          -----------------
;------------------------------------------------------------------------------------

	ORDER_CART_ITEM PROC
				;--NL
				MOV AH,09H
				LEA DX,NL
				INT 21H

				;--BLANK
				MOV AH,09H
				LEA DX,BLANK_15
				INT 21H

				;--NO.
				MOV AH,02H
				MOV DL,NUM
				INC DL
				ADD DL,30H
				INT 21H
	
				;--DOT
				MOV AH,02H
				MOV DL,DOT
				INT 21H

				;--BLANK
				MOV AH,09H
				LEA DX,BLANK_4
				INT 21H

				;----------------
				;--DISPLAY ITEM--
				;----------------
				MOV BL,ORDER_ITEM[SI]
				CALL ORDER_DISPLAY_RICE_NAME

				;--BLANK
				MOV AH,09H
				LEA DX,BLANK_2
				INT 21H

				;------------------
				;--DISPLAY WEIGHT--
				;------------------
				MOV BL,ORDER_WEIGHT[SI]	
				CALL ORDER_DISPLAY_WEIGHT

				;--BLANK
				MOV AH,09H
				LEA DX,BLANK_7
				INT 21H		
	
				;---------------
				;--DISPLAY QTY--
				;---------------
				MOV BL,ORDER_QTY[SI]

				MOV AH,02H
				MOV DL,BL
				ADD DL,30H
				INT 21H

				;--BLANK
				MOV AH,09H
				LEA DX,BLANK_5
				INT 21H	


	RET
	ORDER_CART_ITEM ENDP

;------------------------------------------------------------------------------------
;------------------             [ DISPLAY ORDER CART  ]            ------------------
;------------------------------------------------------------------------------------

	ORDER_CART PROC
		;-----------------------
		;--DISPLAY CART HEADER--
		;-----------------------
		MOV AH,09H
		LEA DX,CART_TITLE
		INT 21H

		MOV AH,09H
		LEA DX,CART_HEADER_TITLE
		INT 21H

		;-----------------------
		;-- DISPLAY CART ITEM --
		;-----------------------
		
		MOV NUM,0
		MOV BL,ORDER_COUNT
		MOV BH,0
		MOV CX,BX
		ORDER_CART_L1:
				MOV AL,NUM
				MOV AH,0
				MOV SI,AX

				CALL ORDER_CART_ITEM

				INC NUM

		LOOP ORDER_CART_L1
	
		;-----------------------
		;--DISPLAY CART BORDER--
		;-----------------------

		MOV AH,09H
		LEA DX,CART_BORDER_1
		INT 21H
			
		;--------------------
		;--DISPLAY SUBTOTAL--
		;--------------------
		MOV AX,ORDER_SUBTOTAL
		MOV BL,TEN
		MOV BH,0
		MUL BX 
		MOV BX,AX
		CALL ORDER_DISPLAY_DIGIT_3_2

		MOV AH,09H
		LEA DX,CART_BORDER_2
		INT 21H
	
	RET
	ORDER_CART ENDP

;------------------------------------------------------------------------------------
;----------------------                  [ DATE  ]            -----------------------
;------------------------------------------------------------------------------------

	DISPLAY_DATE PROC

			;--Day Part
			DAY:
				MOV AH,2AH    ; To get System Date
				INT 21H
				MOV AL,DL     ; Day is in DL
				AAM
				MOV BX,AX
				CALL DISP

				MOV DL,'/'
				MOV AH,02H    ; To Print / in DOS
				INT 21H

			;--Month Part
			MONTH:
				MOV AH,2AH    ; To get System Date
				INT 21H
				MOV AL,DH     ; Month is in DH
				AAM
				MOV BX,AX
				CALL DISP

				MOV DL,'/'    ; To Print / in DOS
				MOV AH,02H
				INT 21H

			;--Year Part
			YEAR:
				MOV AH,2AH    ; To get System Date
				INT 21H
				ADD CX,0F830H ; To negate the effects of 16bit value,
				MOV AX,CX     ; since AAM is applicable only for AL (YYYY -> YY)
				AAM
				MOV BX,AX
				CALL DISP

	RET 
	DISPLAY_DATE ENDP

	;--Display Part
	DISP PROC
			MOV DL,BH      ; Since the values are in BX, BH Part
			ADD DL,30H     ; ASCII Adjustment
			MOV AH,02H     ; To Print in DOS
			INT 21H

			MOV DL,BL      ; BL Part 
			ADD DL,30H     ; ASCII Adjustment
			MOV AH,02H     ; To Print in DOS
			INT 21H

	RET
	DISP ENDP      

;------------------------------------------------------------------------------------
;----------------------                  [ TIME  ]            -----------------------
;------------------------------------------------------------------------------------
	
	DISPLAY_TIME PROC
			;--Hour Part
			HOUR:
				MOV AH,2CH    ; To get System Time
				INT 21H
				MOV AL,CH     ; Hour is in CH
				AAM
				MOV BX,AX
				CALL DISP

				MOV DL,':'
				MOV AH,02H    ; To Print : in DOS
				INT 21H

			;--Minutes Part
			MINUTES:
				MOV AH,2CH    ; To get System Time
				INT 21H
				MOV AL,CL     ; Minutes is in CL
				AAM
				MOV BX,AX
				CALL DISP

				MOV DL,':'    ; To Print : in DOS
				MOV AH,02H
				INT 21H

			;--Seconds Part
			Seconds:
				MOV AH,2CH    ; To get System Time
				INT 21H
				MOV AL,DH     ; Seconds is in DH
				AAM
				MOV BX,AX
				CALL DISP
	RET
	DISPLAY_TIME ENDP

;=========================================================================
;---------------------------------STOCK REPORT----------------------------
;=========================================================================

STOCK_REPORT_FN PROC

	;--------------------  MENU FOR STOCK REPORT  --------------------
	STOCK_REPORT:
		CALL CLEARSCREEN

		;-----stock report menu
		MOV AH,09H
		LEA DX,STOCK_R_MENU 
		INT 21H

		MOV AH,09H
		LEA DX,R_SELECT_STR
		INT 21H

		MOV AH,01H
		INT 21H
		SUB AL,48
		MOV R_SELECT,AL

		CMP R_SELECT,5
		JE STOCK_R_SELECT_FIN1
		JG STOCK_R_TRY_AGAIN
		
		CMP R_SELECT,1
		JL STOCK_R_TRY_AGAIN
		JE CHECK_STOCK_BALANCE1

		CMP R_SELECT,4
		JL STOCK_R_DETAILS   
		
		;----jump back to main menu
		CALL INTO_SYSTEM

		;------help to jmp more far
		STOCK_R_SELECT_FIN1:
			CALL R_SELECT_FIN

		ADD_STOCK1:
			JMP ADD_STOCK

		CHECK_STOCK_BALANCE1:
			JMP CHECK_STOCK_BALANCE
		
	;----start action of stock report
		;---wrong input,jmp back to stock report menu
		STOCK_R_TRY_AGAIN:
			CALL R_DISP_ERROR_MESSAGE
			
			JMP STOCK_REPORT

		;----- check stock details
		STOCK_R_DETAILS:
			CALL CLEARSCREEN

			;------display rice name and code
			CALL R_DISP_RICE_NAME		
	
			;----if select 3 (add stock)
			CMP R_SELECT,3
			JE ADD_STOCK1

			MOV AH,09H
			LEA DX,RICE_CODE_SELECT_STR
			INT 21H	

			MOV AH,01H
			INT 21H
			SUB AL,48
			MOV RICE_CODE_SELECTION,AL

			CMP RICE_CODE_SELECTION,5
			JG ST_R_CHECK_D_INV

			CMP RICE_CODE_SELECTION,1
			JL ST_R_CHECK_D_INV

			CALL CLEARSCREEN

			MOV AH,09H
			LEA DX,STOCK_R_RICE_D_HEADER
			INT 21H	
		
		CHECK_RICE_CODE_SELECTION:
			CMP RICE_CODE_SELECTION,5
			JG ST_R_CHECK_D_INV
			JE STOCK_R_P_VE1

			CMP RICE_CODE_SELECTION,1
			JL ST_R_CHECK_D_INV
			JE STOCK_R_P_FR

			CMP RICE_CODE_SELECTION,2
			JE STOCK_R_P_BA

			CMP RICE_CODE_SELECTION,3
			JE STOCK_R_P_BR1

			CMP RICE_CODE_SELECTION,4
			JE STOCK_R_P_GL1

			ST_R_CHECK_D_INV:
				CALL R_DISP_ERROR_MESSAGE
			
				JMP STOCK_R_DETAILS
		
			;----help jump more far
			STOCK_R_P_VE1:
				JMP STOCK_R_P_VE

			STOCK_R_P_BR1:
				JMP STOCK_R_P_BR

			STOCK_R_P_GL1:
				JMP STOCK_R_P_GL

		;----check stock balance
		CHECK_STOCK_BALANCE:
			CALL CLEARSCREEN

			MOV AH,09H
			LEA DX,STOCK_R_RICE_B_HEADER
			INT 21H
		
		;-----1 display weight of fragrant rice
		STOCK_R_P_FR:
			MOV AH,09H
			LEA DX,FR_RICE_STR
			INT 21H	
				
			MOV RICE_NUM,1

			;----store ori weight and weight sold
			;----stock on hand (qty,qty,kg)
			MOV AX,FR_SP_ON_HAND 
			MOV STOCK_ON_HAND_SP,AX

			MOV AX,FR_BP_ON_HAND 
			MOV STOCK_ON_HAND_BP,AX

			MOV AX,FR_UNP_ON_HAND
			MOV STOCK_ON_HAND_UP,AX
			
			;----qty
			MOV AL,FR_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL
				
			MOV SMALL_P_PER_KG,5
			MOV BIG_P_PER_KG,10

			MOV AL,FR_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			;---kg
			MOV AX,FR_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			JMP STOCK_R_RICE_DETAILS
		
	     	;-----2 display details of basmati rice
		STOCK_R_P_BA:
			;---if show detail then no need display new line
			CMP R_SELECT,1
			JNE DIRECT_SHOW_R2_STR

			MOV AH,09H
			LEA DX,NL
			INT 21H	

			DIRECT_SHOW_R2_STR:
				MOV AH,09H
				LEA DX,BA_RICE_STR
				INT 21H	

			MOV RICE_NUM,2

			;----store ori weight and weight sold
			;----stock on hand (qty,qty,kg)
			MOV AX,BA_SP_ON_HAND 
			MOV STOCK_ON_HAND_SP,AX

			MOV AX,BA_BP_ON_HAND 
			MOV STOCK_ON_HAND_BP,AX

			MOV AX,BA_UNP_ON_HAND
			MOV STOCK_ON_HAND_UP,AX
			
			;----qty
			MOV AL,BA_P_1KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL
				
			MOV SMALL_P_PER_KG,1
			MOV BIG_P_PER_KG,5

			MOV AL,BA_P_5KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			;---kg
			MOV AX,BA_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			JMP STOCK_R_RICE_DETAILS
		
		;-----3 display details of brown rice
		STOCK_R_P_BR:
			;---if show detail then no need display new line
			CMP R_SELECT,1
			JNE DIRECT_SHOW_R3_STR

			MOV AH,09H
			LEA DX,NL
			INT 21H	

			DIRECT_SHOW_R3_STR:
				MOV AH,09H
				LEA DX,BR_RICE_STR
				INT 21H	

			MOV RICE_NUM,3

			;----store ori weight and weight sold
			;----stock on hand (qty,qty,kg)
			MOV AX,BR_SP_ON_HAND 
			MOV STOCK_ON_HAND_SP,AX

			MOV AX,BR_BP_ON_HAND 
			MOV STOCK_ON_HAND_BP,AX

			MOV AX,BR_UNP_ON_HAND
			MOV STOCK_ON_HAND_UP,AX
			
			;----qty
			MOV AL,BR_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL
				
			MOV SMALL_P_PER_KG,5
			MOV BIG_P_PER_KG,10

			MOV AL,BR_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			;---kg
			MOV AX,BR_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			JMP STOCK_R_RICE_DETAILS

	  	;-----4 display details of glutinous rice
		STOCK_R_P_GL:
			;---if show detail then no need display new line
			CMP R_SELECT,1
			JNE DIRECT_SHOW_R4_STR

			MOV AH,09H
			LEA DX,NL
			INT 21H	

			DIRECT_SHOW_R4_STR:
				MOV AH,09H
				LEA DX,GL_RICE_STR
				INT 21H	

			MOV RICE_NUM,4

			;----store ori weight and weight sold
			;----stock on hand (qty,qty,kg)
			MOV AX,GL_SP_ON_HAND 
			MOV STOCK_ON_HAND_SP,AX

			MOV AX,GL_BP_ON_HAND 
			MOV STOCK_ON_HAND_BP,AX

			MOV AX,GL_UNP_ON_HAND
			MOV STOCK_ON_HAND_UP,AX
			
			;----qty
			MOV AL,GL_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL
				
			MOV SMALL_P_PER_KG,5
			MOV BIG_P_PER_KG,10

			MOV AL,GL_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			;---kg
			MOV AX,GL_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			JMP STOCK_R_RICE_DETAILS
	
	  	;-----5 display details of rice vernicelli
		STOCK_R_P_VE:
			;---if show detail then no need display new line
			CMP R_SELECT,1
			JNE DIRECT_SHOW_R5_STR

			MOV AH,09H
			LEA DX,NL
			INT 21H	

			DIRECT_SHOW_R5_STR:
				MOV AH,09H
				LEA DX,VE_RICE_STR
				INT 21H	

			MOV RICE_NUM,5

			;----store ori weight and weight sold
			;----stock on hand (qty,qty,kg)
			MOV AX,VE_SP_ON_HAND 
			MOV STOCK_ON_HAND_SP,AX

			MOV AX,VE_BP_ON_HAND 
			MOV STOCK_ON_HAND_BP,AX

			MOV AX,VE_UNP_ON_HAND
			MOV STOCK_ON_HAND_UP,AX
			
			;----qty
			MOV AL,VE_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL
				
			MOV SMALL_P_PER_KG,5
			MOV BIG_P_PER_KG,10

			MOV AL,VE_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			;---kg
			MOV AX,VE_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

		;-----calculate weight and no. of packs
		STOCK_R_RICE_DETAILS:
			MOV NEW_STOCK_ON_HAND,0
			
			STOCK_R_CAL_SP: 
				;------decide display weight or not
				CMP R_SELECT,1
				JE STOCK_R_START_CAL_W

				CMP R_SELECT,3
				JE STOCK_R_START_CAL_W

				;-----small pac str
				CMP SMALL_P_PER_KG,5
				JE STR_SMALL_P_5KG

				MOV AH,09H
				LEA DX,STOCK_R_SP_STR
				INT 21H
				
				JMP STOCK_R_START_CAL_W

				STR_SMALL_P_5KG:
					MOV AH,09H
					LEA DX,STOCK_R_MP_STR
					INT 21H					
						
			STOCK_R_START_CAL_W:	
				MOV STATUS_STOCK_R,'Y' 
				MOV STATUS_STOCK_R1,'S' 

				;---calculate latest stock on hand
				MOV AH,0
				MOV AL,P_RICE_SMALL_SOLD 
				SUB STOCK_ON_HAND_SP,AX
				
				;----calculate latest weight
				MOV AX,STOCK_ON_HAND_SP
				MUL SMALL_P_PER_KG
				ADD NEW_STOCK_ON_HAND,AX

				;------decide display weight or not
				CMP R_SELECT,1
				JE ST_R_CHECK_STATUS1

				CMP R_SELECT,3
				JE ST_R_CHECK_STATUS1

				JMP ST_R_CONT_SPR

				ST_R_CHECK_STATUS1:
					JMP ST_R_CHECK_STATUS
		
			;-----seperate digit and display weight
			ST_R_CONT_SPR:
				CALL ST_R_SPR_W	

				MOV AX,STOCK_ON_HAND_SP
				MOV STOCK_ON_HAND_P,AX
		
			ST_R_DISP_DETAILS_P_RICE:
				CALL STOCK_R_DISP_NO_D
				
				CMP STATUS_STOCK_R,'N'
				JE ST_R_CHECK_STATUS

					MOV AH,09H
					LEA DX,KG
					INT 21H
			
				;-----seperate digit of no. of pack		
				MOV UNIT_CAL_THOU,0

				MOV AX,STOCK_ON_HAND_P
				DIV TEN
				MOV UNIT_CAL_ONE,AH
				MOV UNIT_CAL_TEN,AL

				MOV AH,0
				MOV AL,UNIT_CAL_TEN
				DIV TEN
				MOV UNIT_CAL_HUND,AL
				MOV UNIT_CAL_TEN,AH
			
				;----display no. of pack
				MOV AH,09H
				LEA DX,SPACE_P_STOCK_R 
				INT 21H

				MOV STATUS_STOCK_R,'N'

				JMP ST_R_DISP_DETAILS_P_RICE
		
			ST_R_CHECK_STATUS:
				CMP STATUS_STOCK_R1,'S'
				JE STOCK_R_CAL_BP
				
				CMP STATUS_STOCK_R1,'B'
				JE STOCK_R_CAL_UP
		
			;-----show big pack rice on hand
			STOCK_R_CAL_BP:
			     ;------decide display weight or not
				CMP R_SELECT,1
				JE STOCK_R_START_CAL_W1

				CMP R_SELECT,3
				JE STOCK_R_START_CAL_W1

			     ;-----big pac str
				CMP SMALL_P_PER_KG,5
				JE STR_BIG_P_10KG

				MOV AH,09H
				LEA DX,STOCK_R_MP_STR
				INT 21H

				JMP STOCK_R_START_CAL_W1

				STR_BIG_P_10KG:
					MOV AH,09H
					LEA DX,STOCK_R_LP_STR
					INT 21H	

			STOCK_R_START_CAL_W1:
				MOV STATUS_STOCK_R,'Y'
				MOV STATUS_STOCK_R1,'B'

				;---calculate latest stock on hand
				MOV AH,0
				MOV AL,P_RICE_BIG_SOLD 
				SUB STOCK_ON_HAND_BP,AX
				
				;----calculate latest weight
				MOV AX,STOCK_ON_HAND_BP
				MUL BIG_P_PER_KG
				ADD NEW_STOCK_ON_HAND,AX

				;-----seperate digit
				CALL ST_R_SPR_W
				
				MOV AX,STOCK_ON_HAND_BP
				MOV STOCK_ON_HAND_P,AX

			     ;------decide display weight or not
				CMP R_SELECT,1
				JE STOCK_R_CAL_UP

				CMP R_SELECT,3
				JE STOCK_R_CAL_UP

				;---jmp to display 
				JMP ST_R_DISP_DETAILS_P_RICE
		
			;-------show unpacked rice on hand
			STOCK_R_CAL_UP:
			     ;------decide display weight or not
				CMP R_SELECT,1
				JE STOCK_R_START_CAL_W2

				CMP R_SELECT,3
				JE STOCK_R_START_CAL_W2

			     ;----display unpack details
				MOV AH,09H
				LEA DX,STOCK_R_UP_STR
				INT 21H

				MOV STATUS_STOCK_R,'U'

				;---calculate latest stock on hand
			STOCK_R_START_CAL_W2:
				MOV AX,UP_RICE_SOLD 
				SUB STOCK_ON_HAND_UP,AX
			
				;-----mov thousand-th to 0 then cmp to inc or remain
				MOV UNIT_CAL_THOU,0

				CMP STOCK_ON_HAND_UP,10000
				JL ST_R_SPR_UP_W

				ST_R_BEFORE_SPR_UP_W:
					SUB STOCK_ON_HAND_UP,10000
					INC UNIT_CAL_THOU

				CMP STOCK_ON_HAND_UP,10000
				JL ST_R_SPR_UP_W
				JMP ST_R_BEFORE_SPR_UP_W

				;-----seperate weight
			ST_R_SPR_UP_W:
				MOV AX,STOCK_ON_HAND_UP

				CALL R_SPR_DIGIT

			     ;----calculate latest weight (+unpack)
				CALL ST_R_CAL_LATEST_TT_W

			     ;------decide display weight or not
				CMP R_SELECT,1
				JE ST_R_SHOW_TOTAL_W

				CMP R_SELECT,3
				JE ST_R_SHOW_TOTAL_W

			     ;----display weight (UP)
			STOCK_R_DISP_WITH_D:
				CALL STOCK_R_DISP_NO_D

					MOV AH,02H
					MOV DL,'.'
					INT 21H

					MOV AH,02H
					MOV DL,UNIT_DECIMAL
					ADD DL,48
					INT 21H

					MOV AH,09H
					LEA DX,KG
					INT 21H

					CMP STATUS_STOCK_R,'T'
					JNE ST_R_DISP_DASH
					JMP STOCK_R_CHECK_RICE_NUM

				ST_R_DISP_DASH:
					MOV AH,09H
					LEA DX,SPACE_P_STOCK_R 
					INT 21H

					MOV AH,02H
					MOV DL,'-'
					INT 21H
					
		      ;----show total weight
			ST_R_SHOW_TOTAL_W:
			     ;------decide display weight or not
				CMP R_SELECT,1
				JE STOCK_R_START_CAL_T

				CMP R_SELECT,3
				JE STOCK_R_START_CAL_T

			     ;----show total details
				MOV AH,09H
				LEA DX,TOTAL_ON_HAND_STR
				INT 21H

				;-----seperate digit
			STOCK_R_START_CAL_T:
				MOV STATUS_STOCK_R,'T'

				;------cmp to determine ten thousand
				MOV UNIT_CAL_TTHOU,0
	
				CMP NEW_STOCK_ON_HAND,10000
				JL STOCK_R_SPR_T_W

				ST_R_BEFORE_SPR_T_W:
					SUB NEW_STOCK_ON_HAND,10000
					INC UNIT_CAL_TTHOU

				CMP NEW_STOCK_ON_HAND,10000
				JL STOCK_R_SPR_T_W
				JMP ST_R_BEFORE_SPR_T_W

			STOCK_R_SPR_T_W:
				MOV AX,NEW_STOCK_ON_HAND

				CALL ST_R_SPR_W

				;------display ten thousand first
				CMP UNIT_CAL_TTHOU,0
				JNE ST_R_DISP_TTHOU
			
				MOV AH,02H
				MOV DL,' '
				INT 21H

				;-----jump to display other
				JMP STOCK_R_DISP_WITH_D

				ST_R_DISP_TTHOU:
					MOV AH,02H
					MOV DL,UNIT_CAL_TTHOU
					ADD DL,48
					INT 21H
					
					JMP STOCK_R_DISP_WITH_D
				
			;-----use to check rice num
			STOCK_R_CHECK_RICE_NUM:
				;-----if show details then no need check rice num
				CMP R_SELECT,2
				JE BACK_TO_STOCK_REPORT

				CMP R_SELECT,3
				JE ST_R_ASK_WEIGHT

				CMP RICE_NUM,1
				JE J_STOCK_R_P_BA 

				CMP RICE_NUM,2
				JE J_STOCK_R_P_BR

				CMP RICE_NUM,3
				JE J_STOCK_R_P_GL

				CMP RICE_NUM,4
				JE J_STOCK_R_P_VE

			;------back to stock report
			BACK_TO_STOCK_REPORT:
				MOV AH,09H
				LEA DX,BACK_ST_R_MENU
				INT 21H
			
				MOV AH,01H
				INT 21H
				MOV BACK_R_SELECT,AL

				CMP BACK_R_SELECT,'N'
				JE J_MAIN_MENU
		
				CMP BACK_R_SELECT,'n'
				JE J_MAIN_MENU

				JMP STOCK_REPORT
			
			J_MAIN_MENU:
				CALL INTO_SYSTEM

			;-----suppport above to jmp further
			J_STOCK_R_P_VE:
				JMP STOCK_R_P_VE

			J_STOCK_R_P_BA:
				JMP STOCK_R_P_BA

			J_STOCK_R_P_BR:
				JMP STOCK_R_P_BR

			J_STOCK_R_P_GL:
				JMP STOCK_R_P_GL
	
		;---- add stock amount	
		ADD_STOCK:	
			MOV AH,09H
			LEA DX,RICE_CODE_MODIFY
			INT 21H

			MOV AH,01H
			INT 21H
			SUB AL,48
			MOV RICE_CODE_SELECTION,AL

			CMP RICE_CODE_SELECTION,5
			JG ST_R_CHECK_D_INV1

			CMP RICE_CODE_SELECTION,1
			JL ST_R_CHECK_D_INV1

			MOV ST_R_BACK,'N'

			MOV AH,09H
			LEA DX,STOCK_R_RICE_B_HEADER
			INT 21H
			
			;----jump to show rice details
			JMP CHECK_RICE_CODE_SELECTION

			ST_R_CHECK_D_INV1:
				JMP ST_R_CHECK_D_INV
			
		ST_R_ASK_WEIGHT:
			CMP ST_R_BACK,'Y'
			JNE ST_R_ASK_WEIGHT1
			JMP BACK_TO_STOCK_REPORT
			
		ST_R_ASK_WEIGHT1:
			MOV AH,09H
			LEA DX,STOCK_R_WEIGHT_MODIFY
			INT 21H
				
			;------accept input
			MOV AH,0AH
			LEA DX,ST_R_INPUT_W
			INT 21H

			;-----mov input to add weight
			ST_R_ADD_INP_TO_NUM:
				MOV CH,0
				MOV CL,NUM_ST_R_INPUT_W

				MOV SI,CX
				DEC SI

				MOV DI,0

				MOV RICE_WEIGHT_ADD,0

			;----convert string to num then add up
			L_ADD_INP_TO_NUM:	
				MOV AH,0
				MOV AL,ACT_ST_R_INPUT_W[SI]
				SUB AX,48

				;-----if invalid then jmp out
				CMP AX,9
				JG ST_R_INV_INP_W

				CMP AX,0
				JL ST_R_INV_INP_W

				MUL INPUT_WEIGHT_POSITION[DI]
				ADD RICE_WEIGHT_ADD,AX
				
				ADD DI,2
				DEC SI
				
			LOOP L_ADD_INP_TO_NUM

			;----ask confirm input
			MOV AH,09H
			LEA DX,ST_R_CONFIRM_ADD_STR
			INT 21H
			
			MOV AH,01H
			INT 21H
			MOV ST_R_CONFIRM_ADD,AL

			CMP ST_R_CONFIRM_ADD,'Y'
			JE J_UPDATE_ADD_RICE_W
			
			CMP ST_R_CONFIRM_ADD,'y'
			JE J_UPDATE_ADD_RICE_W
			
			JMP ST_R_ASK_WEIGHT1

			;----update the weight
			J_UPDATE_ADD_RICE_W:
				CALL ST_R_UPDATE_ADD_RICE_W
			
		;----display weight
		ST_R_DISP_NEW_W:
			;---do not ask weight again
			MOV ST_R_BACK,'Y'

			MOV AH,09H
			LEA DX,STOCK_R_UPDATED_STR
			INT 21H

			JMP CHECK_RICE_CODE_SELECTION

		;-----invalid input weight,jmp back to input	
		ST_R_INV_INP_W:
			CALL R_DISP_ERROR_MESSAGE

			JMP ST_R_ASK_WEIGHT1

RET
STOCK_REPORT_FN ENDP

;========================================================================
;-------------------------- DAILY SUMMARY REPORT-------------------------
;========================================================================

SUMMARY_REPORT_FN PROC
	
	;--------------------  MENU FOR SUMMARY REPORT  --------------------
	SUM_REPORT:
		CALL CLEARSCREEN

		;-----summary report menu
		MOV AH,09H
		LEA DX,SUM_R_MENU
		INT 21H

		;-------show total transaction
		MOV AH,09H
		LEA DX,SUM_R_TRANS_STR
		INT 21H

		MOV AL,ORDER_ID
		SUB AL,100
		MOV AH,0
	
		;-------display transaction amount
		CALL ST_R_SPR_W
		CALL STOCK_R_DISP_NO_D

		MOV AH,09H
		LEA DX,SUM_R_MENU1
		INT 21H
	
		;----prompt input
		MOV AH,09H
		LEA DX,R_SELECT_STR
		INT 21H
	
		;----accept input
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV R_SELECT,AL
	
		;----compare selection
		CMP R_SELECT,1
		JL SUM_R_INV_INP
		JE P_RICE_SUM
	
		CMP R_SELECT,4
		JG SUM_R_INV_INP
 		JE SUM_R_SELECT_FIN
	
		CMP R_SELECT,2
		JE UP_RICE_SUM1	

		JMP DISP_HEADER_BOTH_P_UP

	;---start action of summary report
	SUM_R_INV_INP: 
		CALL R_DISP_ERROR_MESSAGE
		
		JMP SUM_REPORT

	DISP_HEADER_BOTH_P_UP:

		CALL CLEARSCREEN
		;-----mov status "total"
		MOV STATUS_SUM_R,'T'

		MOV AH,09H
		LEA DX,SUM_R_TOTAL_RICE_TT
		INT 21H

		MOV AH,09H
		LEA DX,SUM_R_RICE_HEADER
		INT 21H	

		JMP SUM_R_P_FR

	P_RICE_SUM:
		CALL CLEARSCREEN

		;-----mov status "pack"
		MOV STATUS_SUM_R,'P'

		MOV AH,09H
		LEA DX,SUM_R_P_RICE_TT
		INT 21H	
			
		MOV AH,09H
		LEA DX,SUM_R_RICE_HEADER
		INT 21H	

		JMP SUM_R_P_FR

	;----to help jump again because more far
		UP_RICE_SUM1:
			JMP UP_RICE_SUM

		SUM_R_SELECT_FIN:
			;-----back to main menu if want exit
			CALL INTO_SYSTEM

		J_FR_W_UP_SOLD:
			JMP FR_W_UP_SOLD
		
	     ;-----1 display details of fragrant rice
		SUM_R_P_FR:
			MOV AH,09H
			LEA DX,FR_RICE_STR
			INT 21H	
		
			MOV RICE_NUM,1

			;----jump to calculate weight and price
			MOV SMALL_P_PER_KG,5

			MOV AL,FR_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,AL		
			MOV AL,FR_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,AL

			MOV AX,FR_5KG_PRICE
			MOV P_PRICE1,AX   ;--25.50$
			MOV AX,FR_10KG_PRICE
			MOV P_PRICE2,AX   ;--48.50$
	
			JMP DISPLAY_WEIGHT_PRICE

		;----jump to specific rice
		CHECK_RICE_NUM:
			CMP RICE_NUM,2
			JE SUM_R_P_BA

			CMP RICE_NUM,3
			JE SUM_R_P_BR

			JMP CHECK_RICE_NUM1
		
	     ;-----2 display details of basmati rice
		SUM_R_P_BA:		
			MOV AH,09H
			LEA DX,BA_RICE_STR
			INT 21H	
	
			;----jump to calculate weight and price
			MOV SMALL_P_PER_KG,1

			MOV BL,BA_P_1KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,BL		
			MOV BL,BA_P_5KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,BL

			MOV AX,BA_5KG_PRICE
			MOV P_PRICE2,AX   ;--47.50$
			MOV BX,BA_1KG_PRICE
			MOV P_PRICE1,BX   ;--10.00$

			JMP DISPLAY_WEIGHT_PRICE

	     ;-----3 display details of brown rice
		SUM_R_P_BR:
			MOV AH,09H
			LEA DX,BR_RICE_STR
			INT 21H	
	
			;----jump to calculate weight and price
			MOV SMALL_P_PER_KG,5

			MOV BL,BR_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,BL		
			MOV BL,BR_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,BL

			MOV AX,BR_10KG_PRICE
			MOV P_PRICE2,AX   ;--56.90$
			MOV AX,BR_5KG_PRICE
			MOV P_PRICE1,AX   ;--30.00$

			JMP DISPLAY_WEIGHT_PRICE

		CHECK_RICE_NUM1:
			CMP RICE_NUM,4
			JE SUM_R_P_GL
			
			JMP SUM_R_P_VE

	     ;-----4 display details of glutinous rice
		SUM_R_P_GL:
			MOV AH,09H
			LEA DX,GL_RICE_STR
			INT 21H	

			;----jump to calculate weight and price
			MOV SMALL_P_PER_KG,5

			MOV BL,GL_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,BL		
			MOV BL,GL_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,BL

			MOV AX,GL_10KG_PRICE
			MOV P_PRICE2,AX   ;--58.90$
			MOV AX,GL_5KG_PRICE
			MOV P_PRICE1,AX   ;--31.00$

			JMP DISPLAY_WEIGHT_PRICE

	     ;-----5 display details of rice vernicelli
		SUM_R_P_VE:
			MOV AH,09H
			LEA DX,VE_RICE_STR
			INT 21H	

			;----jump to calculate weight and price
			MOV SMALL_P_PER_KG,5

			MOV BL,VE_P_5KG_TOTALSOLD
			MOV P_RICE_SMALL_SOLD,BL		
			MOV BL,VE_P_10KG_TOTALSOLD
			MOV P_RICE_BIG_SOLD,BL

			MOV AX,VE_10KG_PRICE
			MOV P_PRICE2,AX   ;--60.80$
			MOV AX,VE_5KG_PRICE
			MOV P_PRICE1,AX   ;--32.00$

			JMP DISPLAY_WEIGHT_PRICE
			
		;----use to display all rice weight & price
		DISPLAY_WEIGHT_PRICE:

			;----show weight sold
			CMP SMALL_P_PER_KG,5
			JE SUM_R_W1
				
			MOV AH,0
			MOV AL,P_RICE_BIG_SOLD
			MUL FIVE

			MOV BH,0
			MOV BL,P_RICE_SMALL_SOLD
			ADD AX,BX
			MOV SUM_R_TT_SOLD_W,AX
			
			JMP SUM_R_DIV_W

		;----help to jmp further
		J_SUM_CAL_P_PRICE:
			JMP SUM_CAL_P_PRICE

		SUM_R_W1:
			MOV AH,0
			MOV AL,P_RICE_SMALL_SOLD
			MUL FIVE
			MOV BX,AX

			MOV AH,0
			MOV AL,P_RICE_BIG_SOLD
			MUL TEN
			ADD AX,BX
			MOV SUM_R_TT_SOLD_W,AX

		SUM_R_DIV_W:
			;------if select 3 then jmp to calculate unpack
			CMP R_SELECT,3
			JE J_SUM_CAL_P_PRICE
   
			DIV TEN
			MOV UNIT_CAL_TEN,AL
			MOV UNIT_CAL_ONE,AH

			MOV AH,0
			MOV AL,UNIT_CAL_TEN     
			DIV TEN
			MOV UNIT_CAL_HUND,AL
			MOV UNIT_CAL_TEN,AH

			;-----display weight from hundred
			CALL SUM_R_DISP_HUN_TEN_ONE

			;---display unit KG
			MOV AH,09H
			LEA DX,KG
			INT 21H	

			;----Price earn
		SUM_CAL_P_PRICE:
			;----calculate SMALL packed
			MOV AH,0
			MOV AL,P_RICE_SMALL_SOLD
			MUL P_PRICE1
			MOV CAL_RESULT_PRICE,AX

			;----calculate BIG packed
			MOV AH,0
			MOV AL,P_RICE_BIG_SOLD
			MUL P_PRICE2
			ADD CAL_RESULT_PRICE,AX

			;----mov both pack total into grand total
			MOV AX,CAL_RESULT_PRICE
			MOV SUM_R_TT_SOLD_P,AX

			CMP R_SELECT,3
			JNE SUM_R_B4_SPR_DIGIT
			JMP BOTH_P_UP_SUM
			
		;------add thousand unit if have
		SUM_R_B4_SPR_DIGIT:
			MOV UNIT_CAL_THOU,0

			CMP CAL_RESULT_PRICE,10000
			JL SEPERATE_PRICE_DIGIT
			
			SUM_R_INC_THOU:
				SUB CAL_RESULT_PRICE,10000
				INC UNIT_CAL_THOU
			
			CMP CAL_RESULT_PRICE,10000
			JL SEPERATE_PRICE_DIGIT
			JMP SUM_R_INC_THOU

		;---seperate the decimal, one, tenth and hundred
		SEPERATE_PRICE_DIGIT:
			MOV AX,CAL_RESULT_PRICE
			DIV HUNDRED
			MOV UNIT_CAL_ONE,AH
			MOV UNIT_CAL_HUND,AL

			MOV AH,0
			MOV AL,UNIT_CAL_ONE
			DIV TEN
			MOV UNIT_DECIMAL,AH
			MOV UNIT_CAL_ONE,AL
			
			MOV AH,0
			MOV AL,UNIT_CAL_HUND
			DIV TEN
			MOV UNIT_CAL_TEN,AH
			MOV UNIT_CAL_HUND,AL
			
			;----display the price result
			MOV AH,09H
			LEA DX,SPACE_P_SUM_R
			INT 21H

		DISPLAY_PRICE:
			MOV AH,09H
			LEA DX,RM
			INT 21H

			;----display thou
			CMP UNIT_CAL_THOU,0
			JNE SUM_R_SHOW_THOU

			MOV AH,02H
			MOV DL,' '
			INT 21H
			JMP SUM_R_CHECK_HUND
			
		SUM_R_SHOW_THOU:
			MOV AH,02H
			MOV DL,UNIT_CAL_THOU
			ADD DL,30H
			INT 21H
			
			JMP SUM_R_SHOW_HUND

		SUM_R_CHECK_HUND:
			;----display hundred
			CMP UNIT_CAL_HUND,0
			JNE SUM_R_SHOW_HUND

			MOV AH,02H
			MOV DL,' '
			INT 21H
			JMP SUM_R_SHOW_TEN
			
		SUM_R_SHOW_HUND:
			MOV AH,02H
			MOV DL,UNIT_CAL_HUND
			ADD DL,30H
			INT 21H

			;--display ten and one
		SUM_R_SHOW_TEN:
			CALL R_DISP_TEN_ONE

			MOV AH,02H
			MOV DL,'.'
			INT 21H

			MOV AH,02H
			MOV DL,UNIT_DECIMAL
			ADD DL,30H
			INT 21H

			MOV AH,02H
			MOV DL,'0'
			INT 21H

			;----increase rice num and jump to check rice num
			CMP STATUS_SUM_R,'T'
			JE MANAGE_P_RICE_NUM

			CMP STATUS_SUM_R,'P'
			JE MANAGE_P_RICE_NUM
			
			JMP MANAGE_UP_RICE_NUM

			MANAGE_P_RICE_NUM:
				INC RICE_NUM
	
				CMP RICE_NUM,5
				JG J_SUM_REPORT
	
				JMP CHECK_RICE_NUM

		;-----help to jmp further
		J_SUM_REPORT:
			MOV AH,09H
			LEA DX,BACK_SUM_R_MENU
			INT 21H

			MOV AH,01H
			INT 21H
			MOV BACK_R_SELECT,AL

			CMP BACK_R_SELECT,'N'
			JE BACK_MAIN_MENU1

			CMP BACK_R_SELECT,'n'
			JE BACK_MAIN_MENU1
			
			JMP SUM_REPORT

		BACK_MAIN_MENU1:
			CALL INTO_SYSTEM

	UP_RICE_SUM:
		CALL CLEARSCREEN

		MOV STATUS_SUM_R,'U'

		MOV AH,09H
		LEA DX,SUM_R_UP_RICE_TT
		INT 21H	

		MOV AH,09H
		LEA DX,SUM_R_RICE_HEADER
		INT 21H	
		
		MOV RICE_NUM,1

	     ;-----1 display details of fragrant rice
		SUM_R_UP_FR:
			;----if 3(show total) then jmp to cal
			CMP R_SELECT,3
			JE FR_W_UP_SOLD

			MOV AH,09H
			LEA DX,FR_RICE_STR
			INT 21H	
		
			;----show weight sold
		FR_W_UP_SOLD:
			MOV AL,FR_100G_PRICE
			MOV UP_PRICE,AL
			MOV AX,FR_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			CMP R_SELECT,3
			JNE J_CAL_UP_WEIGHT_PRICE

			JMP CAL_TT_SOLD_W

		FIN1:
			JMP FIN

	     ;-----2 display details of basmati rice
		SUM_R_UP_BA:
			;----if 3(show total) then jmp to cal
			CMP R_SELECT,3
			JE BA_W_UP_SOLD

			MOV AH,09H
			LEA DX,BA_RICE_STR
			INT 21H	
	
			;----show weight sold
		BA_W_UP_SOLD:
			MOV AL,BA_100G_PRICE
			MOV UP_PRICE,AL
			MOV AX,BA_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			CMP R_SELECT,3
			JNE J_CAL_UP_WEIGHT_PRICE

			JMP CAL_TT_SOLD_W

	     ;-----3 display details of brown rice
		SUM_R_UP_BR:
			;----if 3(show total) then jmp to cal
			CMP R_SELECT,3
			JE BR_W_UP_SOLD

			MOV AH,09H
			LEA DX,BR_RICE_STR
			INT 21H	

			;----show weight sold
		BR_W_UP_SOLD:
			MOV AL,BR_100G_PRICE
			MOV UP_PRICE,AL
			MOV AX,BR_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			CMP R_SELECT,3
			JNE J_CAL_UP_WEIGHT_PRICE

			JMP CAL_TT_SOLD_W

			;----help to jmp more further
			J_CAL_UP_WEIGHT_PRICE:
				JMP CAL_UP_WEIGHT_PRICE

		;----use to check rice num
	    	CHECK_UP_RICE_NUM:
			CMP RICE_NUM,1
			JE J_SUM_R_UP_FR

			CMP RICE_NUM,2
			JE J_SUM_R_UP_BA

			CMP RICE_NUM,3
			JE SUM_R_UP_BR

			CMP RICE_NUM,4
			JE SUM_R_UP_GL

			JMP SUM_R_UP_VE

		J_SUM_R_UP_FR:
			JMP SUM_R_UP_FR

		J_SUM_R_UP_BA:
			JMP SUM_R_UP_BA

	     ;-----4 display details of glutinous rice
		SUM_R_UP_GL:
			;----if 3(show total) then jmp to cal
			CMP R_SELECT,3
			JE GL_W_UP_SOLD

			MOV AH,09H
			LEA DX,GL_RICE_STR
			INT 21H	

			;----show weight sold
		GL_W_UP_SOLD:
			MOV AL,GL_100G_PRICE
			MOV UP_PRICE,AL
			MOV AX,GL_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			CMP R_SELECT,3
			JNE J_CAL_UP_WEIGHT_PRICE

			JMP CAL_TT_SOLD_W

	     ;-----5 display details of rice vernicelli
		SUM_R_UP_VE:
			;----if 3(show total) then jmp to cal
			CMP R_SELECT,3
			JE VE_W_UP_SOLD

			MOV AH,09H
			LEA DX,VE_RICE_STR
			INT 21H	

			;----show weight sold
		VE_W_UP_SOLD:
			
			MOV AL,VE_100G_PRICE
			MOV UP_PRICE,AL
			MOV AX,VE_UNP_TOTALSOLD
			MOV UP_RICE_SOLD,AX

			CMP R_SELECT,3
			JNE CAL_UP_WEIGHT_PRICE

			JMP CAL_TT_SOLD_W

	     ;----calculate weight and price
		;---calculate weight
		CAL_UP_WEIGHT_PRICE:
			MOV AX,UP_RICE_SOLD

			CALL R_SPR_DIGIT

		;---display weight
		;-----display weight from hundred
		
		SUM_R_CAL_UP_W:
			CALL SUM_R_DISP_HUN_TEN_ONE
			
			MOV AH,02H
			MOV DL,'.'
			INT 21H

			MOV AH,02H
			MOV DL,UNIT_DECIMAL
			ADD DL,30H
			INT 21H

			;---display unit KG
			MOV AH,09H
			LEA DX,KG
			INT 21H	

		;---price earn
			;----calculate price
		SUM_CAL_UP_PRICE:
			MOV BH,0
			MOV BL,UP_PRICE
			MOV AX,UP_RICE_SOLD
			MUL BX
			
			ADD SUM_R_TT_SOLD_P,AX

			CMP R_SELECT,3
			JE J_CAL_TT_SOLD_P

			;------cmp to see thou-th unit
			MOV UNIT_CAL_THOU,0

			CMP AX,10000
			JL SUM_R_SPR_UP_PRICE
		
			SUM_R_INC_UP_THOU:
				SUB AX,10000
				INC UNIT_CAL_THOU
				
			CMP AX,10000
			JL SUM_R_SPR_UP_PRICE
		
			JMP SUM_R_INC_UP_THOU
	
		;-----help to jmp more further
		J_CAL_TT_SOLD_P:
			JMP CAL_TT_SOLD_P		
				
		SUM_R_SPR_UP_PRICE:
			CALL R_SPR_DIGIT
		
			;----display price result
			MOV AH,09H
			LEA DX,SPACE_UP_SUM_R
			INT 21H
			
			;-----jmp to packed display price fn
			JMP DISPLAY_PRICE

			;----jump to next rice
		MANAGE_UP_RICE_NUM:
			INC RICE_NUM

			CMP RICE_NUM,5
			JG J_BACK_SUM_REPORT
		
			JMP CHECK_UP_RICE_NUM

		J_BACK_SUM_REPORT:
			JMP J_SUM_REPORT

	;------show total sold of pack and unpack
		BOTH_P_UP_SUM:	
			;----jmp to check rice num
			JMP CHECK_UP_RICE_NUM

		;----calculate total sold (weight)
		CAL_TT_SOLD_W:
			MOV AX,UP_RICE_SOLD
			DIV HUNDRED
			MOV UNIT_CAL_ONE,AH
			MOV UNIT_CAL_TEN,AL
			
			MOV AH,0
			MOV AL,UNIT_CAL_ONE
			DIV TEN
			MOV UNIT_DECIMAL,AH
			MOV AH,0
			ADD SUM_R_TT_SOLD_W,AX
		
			MOV AH,0
			MOV AL,UNIT_CAL_TEN
			MUL TEN
			ADD SUM_R_TT_SOLD_W,AX

			MOV AX,SUM_R_TT_SOLD_W
			DIV TEN 
			MOV UNIT_CAL_ONE,AH
			MOV UNIT_CAL_TEN,AL

			MOV AH,0
			MOV AL,UNIT_CAL_TEN
			DIV TEN
			MOV UNIT_CAL_TEN,AH
			MOV UNIT_CAL_HUND,AL
			
			;----jmp to display weight
			JMP SUM_R_CAL_UP_W

		;------cal total price	
		CAL_TT_SOLD_P:
			;------seperate the total price digit
			MOV UNIT_CAL_THOU,0

			CMP SUM_R_TT_SOLD_P,10000
			JL SUM_R_SPR_TT_PRICE
			
			SUM_R_TT_INC_THOU:
				SUB SUM_R_TT_SOLD_P,10000
				INC UNIT_CAL_THOU

			CMP SUM_R_TT_SOLD_P,10000
			JL SUM_R_SPR_TT_PRICE
			
			JMP SUM_R_TT_INC_THOU

			;-----seperate total price
			SUM_R_SPR_TT_PRICE:
				MOV AX,SUM_R_TT_SOLD_P

				CALL R_SPR_DIGIT

			;----display digit
				MOV AH,09H
				LEA DX,SPACE_UP_SUM_R
				INT 21H

			;----jmp to compare hundred wif 0
				JMP DISPLAY_PRICE

RET
SUMMARY_REPORT_FN ENDP

;========================================================================
;----------------------------- GLOBAL FUNCTION --------------------------
;========================================================================

;;-----function of stock report
;------use to display each type of rice name (sum report & stock report)
	R_DISP_RICE_NAME:
		MOV AH,09H
		LEA DX,NL
		INT 21H	

		MOV AH,09H
		LEA DX,FR_RICE_STR
		INT 21H	

		MOV AH,09H
		LEA DX,BA_RICE_STR
		INT 21H	

		MOV AH,09H
		LEA DX,BR_RICE_STR
		INT 21H	

		MOV AH,09H
		LEA DX,GL_RICE_STR
		INT 21H	

		MOV AH,09H
		LEA DX,VE_RICE_STR
		INT 21H	
		ret

;-----seperate digit thou, hund,ten and one (weight)
	ST_R_SPR_W:
		DIV HUNDRED
		MOV UNIT_CAL_HUND,AL
		MOV UNIT_CAL_ONE,AH

		MOV AH,0
		MOV AL,UNIT_CAL_HUND
		DIV TEN
		MOV UNIT_CAL_THOU,AL
		MOV UNIT_CAL_HUND,AH	

		MOV AH,0
		MOV AL,UNIT_CAL_ONE
		DIV TEN
		MOV UNIT_CAL_TEN,AL
		MOV UNIT_CAL_ONE,AH
		ret	

;---------seperate digit hund, ten, one and decimal
	R_SPR_DIGIT:
		DIV HUNDRED
		MOV UNIT_CAL_TEN,AL
		MOV UNIT_CAL_ONE,AH
				
		MOV AH,0
		MOV AL,UNIT_CAL_ONE
		DIV TEN
		MOV UNIT_CAL_ONE,AL
		MOV UNIT_DECIMAL,AH

		MOV AH,0
		MOV AL,UNIT_CAL_TEN
		DIV TEN
		MOV UNIT_CAL_HUND,AL
		MOV UNIT_CAL_TEN,AH
		RET

;-----display weight and qty with no decimal(pack)
	STOCK_R_DISP_NO_D:
		;----cmp ten thou
		CMP UNIT_CAL_TTHOU,0
		JE ST_R_CHECK_DISP_THOU

		JMP ST_R_DISPLAY_THOU
		
		;---display from thousand
		ST_R_CHECK_DISP_THOU:
			CMP UNIT_CAL_THOU,0
			JNE ST_R_DISPLAY_THOU

			MOV AH,02H
			MOV DL,' '
			INT 21H
				
			JMP ST_R_CHECK_DISP_HUND
			
		ST_R_DISPLAY_THOU:
			MOV AH,02H
			MOV DL,UNIT_CAL_THOU
			ADD DL,48
			INT 21H

			JMP ST_R_DISPLAY_HUND
					
		;---display from hundred
		ST_R_CHECK_DISP_HUND:
		CMP UNIT_CAL_HUND,0
		JNE ST_R_DISPLAY_HUND

		MOV AH,02H
		MOV DL,' '
		INT 21H
			
		JMP ST_R_DISPLAY_TEN

		ST_R_DISPLAY_HUND:
			MOV AH,02H
			MOV DL,UNIT_CAL_HUND
			ADD DL,48
			INT 21H

		ST_R_DISPLAY_TEN:
			CALL R_DISP_TEN_ONE

		;---mov ten thou back to 0 then will not affect other
		MOV UNIT_CAL_TTHOU,0
		ret

;---------------display hundred-th, ten-th and one-th (weight)
	SUM_R_DISP_HUN_TEN_ONE:
		CMP UNIT_CAL_HUND,0
		JNE SUM_R_HUND

		MOV AH,02H
		MOV DL,' '
		INT 21H
		JMP SUM_R_TEN
			
		SUM_R_HUND:
			MOV AH,02H
			MOV DL,UNIT_CAL_HUND
			ADD DL,30H
			INT 21H

		;-----display tenth and one's
		SUM_R_TEN:
			CALL R_DISP_TEN_ONE
		RET

;----------display ten-th and one-th (weight)
	R_DISP_TEN_ONE:
		;---display ten
		MOV AH,02H
		MOV DL,UNIT_CAL_TEN
		ADD DL,30H
		INT 21H
		
		;---display one
		MOV AH,02H
		MOV DL,UNIT_CAL_ONE
		ADD DL,30H
		INT 21H
		RET

;---------------calculate latest weight (pack+unpack)
	ST_R_CAL_LATEST_TT_W:
		MOV AH,0
		MOV AL,UNIT_CAL_THOU
		MUL HUNDRED
		MUL TEN
		ADD NEW_STOCK_ON_HAND,AX

		MOV AH,0
		MOV AL,UNIT_CAL_HUND
		MUL HUNDRED
		ADD NEW_STOCK_ON_HAND,AX

		MOV AH,0
		MOV AL,UNIT_CAL_TEN
		MUL TEN
		ADD NEW_STOCK_ON_HAND,AX

		MOV AH,0
		MOV AL,UNIT_CAL_ONE
		ADD NEW_STOCK_ON_HAND,AX
			
		MOV AX,RICE_WEIGHT_ADD
		ADD NEW_STOCK_ON_HAND,AX
		RET

;----before check rice num, store the new stock result first
	ST_R_UPDATE_ADD_RICE_W:
		MOV AX,RICE_WEIGHT_ADD
		MUL TEN_FOR_N_W

		CMP RICE_NUM,1
		JNE ST_R_CHECK_NEXT1
			
		ADD FR_UNP_ON_HAND,AX

		ST_R_CHECK_NEXT1:
			CMP RICE_NUM,2
			JNE ST_R_CHECK_NEXT2

			ADD BA_UNP_ON_HAND,AX

		ST_R_CHECK_NEXT2:
			CMP RICE_NUM,3
			JNE ST_R_CHECK_NEXT3
				
			ADD BR_UNP_ON_HAND,AX

		ST_R_CHECK_NEXT3:
			CMP RICE_NUM,4
			JNE ST_R_CHECK_NEXT4
	
			ADD GL_UNP_ON_HAND,AX

		ST_R_CHECK_NEXT4:
			CMP RICE_NUM,5
			JNE ST_R_CLEAR_W_ADD
			ADD VE_UNP_ON_HAND,AX

		ST_R_CLEAR_W_ADD:
			MOV RICE_WEIGHT_ADD,0
		RET

;------------display error message------------------
	R_DISP_ERROR_MESSAGE:
		CALL GENERATE_SOUND
		MOV AH,09H
		LEA DX,NL
		INT 21H

		MOV AH,09H
		LEA DX,ERROR_MSG_1
		INT 21H

		MOV AH,09H
		LEA DX,PRESS_KEY
		INT 21H

		MOV AH,01H
		INT 21H
		CMP AL,' '
		JE	R_SELECT_FIN

		
		RET

;------------Exit (user select finish)----------------
	R_SELECT_FIN:		
		MOV AH,09H
		LEA DX,END_MSG 
		INT 21H		
		JMP FIN	

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
.PAUSE1:
    MOV     CX, 65535
.PAUSE2:
    DEC     CX
    JNE     .PAUSE2
    DEC     BX
    JNE     .PAUSE1
    IN      AL, 61H         ; Turn off note (get value from
                                 ;port 61h).
    AND     AL, 11111100B   ; Reset bits 1 and 0.
    OUT     61H, AL         ; Send new value
		
RET
GENERATE_SOUND ENDP

END MAIN