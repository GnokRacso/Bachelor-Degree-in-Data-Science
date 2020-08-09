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
    
    ;STAFFLOGIN FUNC        
    STAFFLOGINSTR1  DB 0DH, 0AH, "PLEASE ENTER YOU STAFF ID AND PASSWORD$"
    USERNAMESTR     DB 0DH, 0AH, "Username:  $" 
    PASSWORDSTR     DB 0DH, 0AH, "Password:  $" 
    
    ENDSYS_MSG      DB 0DH, 0AH, "THANK YOU FOR USING THIS SYSTEM!$"
          
    ;--------------------VARIABLE THAT GOT DATA-------------------------------------------------------------------------------------
    ;STAFF ID AND PW
    UNAME           DB "ICS"
    UPSW            DB "1024"
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
    
    ;STAFF PW
    INSERTNUMPW     DB 0
    STAFFNUMPW      DB 0 
    INPW            LABEL BYTE
    MAXPW           DB 10
    ACTPW           DB ?
    ACTINPW         DB 10 DUP("$")
    
    ;TIMER
    OLDMIN          DB ?
    OLDSEC          DB ?
    NEWMIN          DB ?
    NEWSEC          DB ?
    IN_ONE_MIN      DB 1
    OVER_ONE_MIN    DB 0                    
    