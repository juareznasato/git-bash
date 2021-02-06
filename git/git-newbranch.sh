#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: CREATE BRANCH                               # 
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
# $ sh git-newbranch.sh
#
echo "----------------------------------------"
echo " NEW-BRANCH"
echo "----------------------------------------"
git branch
echo ""
echo -n "Type branch: "
read BRANCH

if [ "$BRANCH" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout -b $BRANCH"
   echo "$ git push origin $BRANCH"
   echo ""
   echo -n "Enter to continue: "
   read CONFIRM
   echo ""

   git checkout -b "$BRANCH";
   git push origin "$BRANCH";
   echo "Branch $BRANCH created."
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

