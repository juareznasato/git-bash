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
echo "----------------------------------------"
echo " PUSH"
echo "----------------------------------------"
git branch
echo ""
default=$(git symbolic-ref -q --short HEAD)
read -p "Type branch [$default]: " VAR
: ${VAR:=$default}
if [ "$VAR" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git pull origin $VAR"
   echo "$ git push origin $VAR"
   echo ""
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""
   git pull origin "$VAR";
   git push origin "$VAR";
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

