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
echo "----------------------------------------"
echo " SWITCH-BRANCH"
echo "----------------------------------------"
git branch
echo ""
echo -n "Type branch: "
read BRANCH

if [ "$BRANCH" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout $BRANCH"
   echo ""
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git checkout "$BRANCH";
   # echo "Switched to branch $BRANCH."
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

