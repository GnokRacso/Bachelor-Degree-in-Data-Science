.DATA
	;====================LOGIN=========================================================
	;--------------------STRING---------------------------------------------------------------------------------------   
	TEST1	DB 0DH, 0AH, "1$"
	TEST2	DB 0DH, 0AH, "2$"

	NL	DB 0DH, 0AH, "$" 

	LOGO	DB 0DH, 0AH, "  _________                                                     _________"
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
		DB 0DH, 0AH, "||              WELCOME TO QUEEN ALEXANDRA BUTTERFLY FARM               ||"
		DB 0DH, 0AH, "==========================================================================" 
		DB 0DH, 0AH, "		1. STAFF LOGIN"
		DB 0DH, 0AH, "		2. VIEW MENU"
		DB 0DH, 0AH, "		3. EXIT"
		DB 0DH, 0AH, " "
		DB 0DH, 0AH, "		ENTER YOUR SELECTION:  $"  
	;LOGIN MENU
	ERROR_MSG_1	DB 0DH, 0AH, "	INVALID INPUT DETECTED.PLEASE TRY AGAIN!"
			DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE([SPACE] TO EXIT)......$"

	;STAFFLOGIN FUNC
	LOGINSTART      DB 0DH, 0AH, "==================================================================="
	                DB 0DH, 0AH, " 				STAFF LOGIN"
	                DB 0DH, 0AH, "===================================================================$"        
	
	STAFFLOGINSTR1	DB 0DH, 0AH, "PLEASE ENTER YOU STAFF ID AND PASSWORD$"
	USERNAMESTR	DB 0DH, 0AH, "	Username:	$" 
	PASSWORDSTR	DB 0DH, 0AH, "	Password:	$"
	NEWPWSTR	DB 0DH, 0AH, "	NEW PASSWORD:		$"
	CONPWSTR	DB 0DH, 0AH, "	CONFIRM PASSWORD:	$"

	STAFFLOGINSTR2	DB 0DH, 0AH, "YOU HAVE FAILED TO LOGIN ATTEMPT!"
			DB 0DH, 0AH, "PLEASE ENTER YOUR NRIC TO CONTINUE LOGIN!"
			DB 0DH, 0AH, "	NRIC:	$"

	ERROR_OT_MSG	DB 0DH, 0AH, "	LOGIN TIME HAVE PASSED, PLEASE TRY AGAIN!"
			DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE LOGIN([SPACE] TO EXIT)......$"

	ERROR_MSG_2	DB 0DH, 0AH, "	USERNAME DOES NOT EXISTS/INCORRECT PASSWORD DETECTED!"
			DB 0DH, 0AH, "	TRY AGAIN OR EXIT (A = AGAIN/E = EXIT):	$"

	ERROR_MSG_3	DB 0DH, 0AH, "	THIS STAFF DOES NOT EXISTS!"
			DB 0DH, 0AH, "	TRY AGAIN OR EXIT (A = AGAIN/E = EXIT):	$"

	ERROR_MSG_4	DB 0DH, 0AH, "	PASSWORD DOES NOT MATCH!"
			DB 0DH, 0AH, "	PRESS ANY KEY TO TRY AGAIN......$"

	REMAINCHANCE	DB 0DH, 0AH, "	REMAINING ATTEMPT: $"
	PRESS_KEY	DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE([SPACE] TO EXIT)......$"	

	NOCHANCEREMAIN	DB 0DH, 0AH, "	YOU HAVE FAILED TO LOGIN ATTEMPT!"
			DB 0DH, 0AH, "	YOU WILL BE DIRECT BACK TO HOMEPAGE"
			DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE......$"

	FORGETPWSTR	DB 0DH, 0AH, "	FORGET PASSWORD?(Y/N): $"
	CONFIRMNEWPW	DB 0DH, 0AH, "	NEW PASSWORD CREATED, PLEASE LOGIN AGAIN!"
			DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE......$"
	
	SUCCESS_LOGIN	DB 0DH, 0AH, "==================================================================="
			DB 0DH, 0AH, "		WELCOME TO QUEEN ALEXANDRA BUTTERFLY FARM"
			DB 0DH, 0AH, "===================================================================$"
	
	FORGET_PASS	DB 0DH, 0AH, "==================================================================="
			DB 0DH, 0AH, "				FORGET PASSWORD"
			DB 0DH, 0AH, "===================================================================$"
	SECURITY_ACCESS	DB 0DH, 0AH, "==================================================================="
			DB 0DH, 0AH, "				SECURITY WARNING"
			DB 0DH, 0AH, "===================================================================$"

	IN_PROGRESS_STR	DB 0DH, 0AH, "	THE SYSTEM WILL BE DIRECTING YOU TO THE MENU$"
	DOT		DB ". $"

	;END SYSTEM
	ENDSYS_MSG	DB 0DH, 0AH, "THANK YOU FOR USING THIS SYSTEM!$"

	;--------------------VARIABLE THAT GOT DATA-------------------------------------------------------------------------------------
	;STAFF
	UNAME		DB "ICS$"
	UPSW		DB "1024$"
	UIC		DB "000906141234$"

	;STAFF LOGIN
	AST		DB "*$"
	NUM		DB 0
	NUM1		DW 0
	NUM2		DW 0
	COUNT		DB 3
	ICCOUNT		DB 3
	;--------------------VARIABLE FOR DATA INPUT------------------------------------------------------------------------------------------
	;LOGIN
	SELECTION	DB ?

	;STAFF ID
	STAFFNUMID	DB 0

	INID		LABEL BYTE
	MAXID		DB 10
	ACTID		DB ?
	ACTINID		DB 10 DUP("$")

	;STAFF PW
	INSERTNUMPW	DB 0
	STAFFNUMPW	DB 0
 
	INPW		LABEL BYTE
	MAXPW		DB 20
	ACTPW		DB ?
	ACTINPW		DB 20 DUP("$")

	NEWPWARR	DB 20 DUP("$")
	CFMPWARR	DB 20 DUP("$")

	;STAFF IC
	INSERTNUMIC	DB 0
	STAFFNUMIC	DB 0 
	
	INIC		LABEL BYTE
	MAXIC		DB 15
	ACTIC		DB ?
	ACTINIC		DB 15 DUP("$")

	;TIMER
	OLDMIN		DB 0
	NEWMIN		DB 0
	DIFFMIN		DB 0
	OLDSEC		DB 0
	SETSEC		DB 3

	;============================================MENU==============================================                    
	;--------------------------------------------MENU VIEW-----------------------------------------
	MENU_VIEW_TABLE	DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	||						BUTTERFLY LIST 						||"
			DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	1. QUEEN ALEXANDRA BUTTERFLY"
			DB 0DH, 0AH, "	2. MORPHO BUTTERFLY"
			DB 0DH, 0AH, "	3. PIERIDAE BUTTERFLY"
			DB 0DH, 0AH, "	4. TIGER SWALLOWTAILS BUTTERFLY"
			DB 0DH, 0AH, "	5. BLUE BUTTERFLY"
			DB 0DH, 0AH, "	6. COPPER BUTTERFLY"
			DB 0DH, 0AH, "	7. HAIRSTREAKS BUTTERFLY"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	||						FOOD LIST 						     ||"
			DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	1. NECTAR SOLUTION"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	||						TICKET TYPE 						   ||"
			DB 0DH, 0AH, "	==================================================================="
			DB 0DH, 0AH, "	1. ADULT"
			DB 0DH, 0AH, "	2. CHILDREN"
			DB 0DH, 0AH, " "	
			DB 0DH, 0AH, "	DO YOU WANT TO START PURCHASE? (Y/N) : $"

	PURCHASE_CAT	DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	||							CATEGORY						||"
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	1. BUTTERFLY"
			DB 0DH, 0AH, "	2. NECTAR"
			DB 0DH, 0AH, "	3. TICKET"
			DB 0DH, 0AH, "	4. EXIT"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	ENTER YOUR SELECTION:	$"

	INCPRICE_TABLE	DB 0DH, 0AH, "						BUTTERFLY"
			DB 0DH, 0AH, "						---------"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	ItemNo.		Butterfly				Price (RM)"
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	B01		QUEEN ALEXANDRA				60.00"
			DB 0DH, 0AH, "	B02		MORPHO						 50.00"
			DB 0DH, 0AH, "	B03		PIERIDAE					   45.00"
			DB 0DH, 0AH, "	B04		TIGER SWALLOWTAILS			 40.00"
			DB 0DH, 0AH, "	B05		BLUE						   30.00"
			DB 0DH, 0AH, "	B06		COPPER						 30.00"
			DB 0DH, 0AH, "	B07		HAIRSTREAKS					30.00"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	ENTER THE THE CODE TO PURCHASE:	$"

	FOODPRICE_TABLE	DB 0DH, 0AH, "						PET FOOD"
			DB 0DH, 0AH, "						--------"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	ItemNo.		Food							Price (RM)"
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	F01		NECTAR SOLUTION (ONE BOTTLE)		 12.00"
			DB 0DH, 0AH, "	F02		NECTAR SOLUTION (6 IN A PACK)		60.00"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	ENTER THE THE CODE TO PURCHASE:	$"

	TICPRICE_TABLE	DB 0DH, 0AH, "						TICKET"
			DB 0DH, 0AH, "						------"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	ItemNo.		Ticket Type				Price (RM)"
			DB 0DH, 0AH, "	===================================================================="
			DB 0DH, 0AH, "	T01			ADULT						15.00"
			DB 0DH, 0AH, "	T02			CHILD						7.00"
			DB 0DH, 0AH, " "
			DB 0DH, 0AH, "	ENTER THE THE CODE TO PURCHASE:	$"

	;---------------------------------------------STRING--------------------------------------------------------
	ERROR_MSG_5	DB 0DH, 0AH, "	INVALID INPUT DETECTED, PLEASE TRY AGAIN!"
			DB 0DH, 0AH, "	PRESS ANY KEY TO CONTINUE......$"

	ERROR_MSG_6	DB 0DH, 0AH, "	INVALID QUANTITY DETECTED!$"

	DIRECT_MSG_1	DB 0DH, 0AH, "	WILL DIRECT YOU IN $"
	
	INSERT_QUAN_STR	DB 0DH, 0AH, "	<0 = BACK TO MENU>"
			DB 0DH, 0AH, "	ENTER THE AMOUNT (1 ~ 9):	$"
	
	CODE_NAME_STR	DB 0DH, 0AH, "	PURCHASED CODE:	$"

	CFM_QUAN_STR	DB 0DH, 0AH, "	CONFIRM QUANTITY (Y/N)?:	$"

	SUB_TT_STR	DB 0DH, 0AH, "	SUBTOTAL:	RM $"
	
	CONTINUE_ORDER	DB 0DH, 0AH, "	CONTINUE ORDER (Y/N)?:	$"
	
	DATE_STR	DB 0DH, 0AH, "	DATE:	$"
	TIME_STR	DB "		TIME:	$"

	;---------------------------------------------VARIABLE FOR INPUT-------------------------------------------------
	CHOICE	DB 4 DUP ("$")
	
	INS_PROD	DB 50 DUP ("$")
	INS_COUNT	DW 0
	INS_QTY		DB 50 DUP ("$")

	FD_PROD		DB 50 DUP ("$")
	FD_COUNT	DW 0
	FD_QTY		DB 50 DUP ("$")

	TIC_PROD	DB 50 DUP ("$")
	TIC_COUNT	DW 0
	TIC_QTY		DB 50 DUP ("$")

	QTY	DB 0

	PRICE_1	DB 0
	HUNDV	DB 0
	TENV	DB 0
	TO_TENV	DB 0
	ONEV	DB 0
	;---------------------------------------------DATA----------------------------------------------------------
	INSECT_PRICE	DB 60, 50, 45, 40, 30, 30, 30
	FOOD_PRICE	DB 12, 60
	TICKET_PRICE	DB 15, 7
	TEN 		DB 10
	
	B01	DB "	B01 QUEEN ALEXANDRA$"
	B02	DB "	B02 MORPHO$"
	B03	DB "	B03 PIERIDAE$"
	B04	DB "	B04 TIGER SWALLOTAILS$"
	B05	DB "	B05 BLUE$"
	B06	DB "	B06 COPPER$"
	B07	DB "	B07 HAIRSTREAKS$"
	F01	DB "	F01 NECTAR SOLUTION (ONE BOTTLE)$"
	F02	DB "	F02 NECTAR SOLUTION (6 IN A PACK)$"
	T01	DB "	T01 ADULT TICKET$"
	T02	DB "	T02 CHILD TICKET$"

	
