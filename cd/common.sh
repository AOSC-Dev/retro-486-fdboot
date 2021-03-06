####################################################
# ===== Neo_Chen's Simple Init Script System ===== #
####################################################

## Colors
ESC="\e"
RESET="${ESC}[0m"	#Reset all attributes
BRIGHT="${ESC}[1m"	#Bright
DIM="${ESC}[2m"	#Dim
BLINK="${ESC}[5m"	#Blink
#Foreground Colours
FBLACK="${ESC}[30m"	#Black
FRED="${ESC}[31m"	#Red
FGREEN="${ESC}[32m"	#Green
FYELLOW="${ESC}[33m"	#Yellow
FBLUE="${ESC}[34m"	#Blue
FMAGENTA="${ESC}[35m"	#Magenta
FCYAN="${ESC}[36m"	#Cyan
FWHITE="${ESC}[37m"	#White
#Background Colours
BBLACK="${ESC}[40m"	#Black
BRED="${ESC}[41m"	#Red
BGREEN="${ESC}[42m"	#Green
BYELLOW="${ESC}[43m"	#Yellow
BBLUE="${ESC}[44m"	#Blue
BMAGENTA="${ESC}[45m"	#Magenta
BCYAN="${ESC}[46m"	#Cyan
BWHITE="${ESC}[47m"	#White

# Normal Message
msg_echo()
{
	echo -e "${BBLUE}>>${RESET} ${BRIGHT}${FYELLOW}${*}${RESET}"
}

# Error Message
err_echo()
{
	echo -e "${BRIGHT}${BRED}>>${RESET} ${BRIGHT}${FRED}${*}${RESET}"
}

sub_echo()
{
	echo -e "\t${BRIGHT}>> ${1}${RESET}"
}
