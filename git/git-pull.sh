#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: EXECUTE PULL                                # 
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
# $ sh git-pull.sh
#
echo "PULL"
echo "--------------------------------------------------"
git branch
echo "--------------------------------------------------"
# default=""
default=$(git symbolic-ref -q --short HEAD)
read -p "Type the branch [$default]: " VAR
: ${VAR:=$default}
if [ "$VAR" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git pull origin $VAR"
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git pull origin "$VAR";
else
   echo "Invalid parameter. Nothing to do."
fi
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

