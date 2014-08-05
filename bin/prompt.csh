#!/bin/csh


set White='%{\e[0;37m%}'
set BPurple='%{\e[1;35m%}'
set Green='%{\e[0;32m%}'
set Blue='%{\e[0;34m%}'
set Yellow='%{\e[0;33m%}'
set Purple='%{\e[0;35m%}'
set BWhite='%{\e[1;37m%}'

set ColorOff='%{\033[0m%}'

set prompt="%{^[]0;%n@%m, %~, %P^G%}${Blue}[%n@%m${Yellow} %~]%#${ColorOff} "

