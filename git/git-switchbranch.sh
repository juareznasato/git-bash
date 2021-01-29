#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: SWITCH BRANCH                               # 
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
# $ sh git-switchbranch.sh
#
echo "SWITCH-BRANCH"
echo "--------------------------------------------------"
git branch
echo "--------------------------------------------------"

echo -n "Type the branch: "
read BRANCH

if [ "$BRANCH" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout $BRANCH"
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git checkout "$BRANCH";
   echo "Switched to branch $BRANCH."
else
   echo "Invalid parameter. Nothing to do."
fi
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

