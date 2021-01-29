#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: EXECUTE PULL AND PUSH                       # 
#------------------------------------------------------------------- #
#                                                                    #
#       AUTHOR:  JUAREZ NASATO                                       #
#       EMAIL:   JUAREZNASATO@GMAIL.COM                              #
#       CREATED: 02/01/2021                                          #
#       VERSION: 0.0.1                                               #
#                                                                    #
######################################################################
#
# --> COMMAND <--
# $ sh git-push.sh
#
echo "PUSH"
echo "--------------------------------------------------"
git branch
echo "--------------------------------------------------"
# default=""
echo "$1"
echo "$2"

default=$(git symbolic-ref -q --short HEAD)

if [ "$1" == "merge" ]
then
default="$2"
fi


read -p "Informe branch [$default]: " VAR
: ${VAR:=$default}
if [ "$VAR" != "" ]
then
   echo ""
   echo "Comandos que serao executados:"
   echo "$ git pull origin $VAR"
   echo "$ git push origin $VAR"
   echo -n "Enter para confirmar: "
   read CONFIRM
   echo ""

   git pull origin "$VAR";
   git push origin "$VAR";
else
   echo "Parametro invalido. Nada foi executado."
fi
echo "Fim";
echo -n "Enter para voltar ao menu: "
read CLOSE
clear
./git/menu.sh

