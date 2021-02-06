#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: EXECUTE ADD AND COMMIT                      # 
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
# $ sh git-commit.sh
#
echo "----------------------------------------"
echo " COMMIT"
echo "----------------------------------------"
git status
echo ""
echo -n "Message: "
read MESSAGE
if [ "$MESSAGE" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git add ."
   echo "$ git commit -m $MESSAGE"
   echo ""
   echo -n "Enter to continue: "
   read CONFIRM
   echo ""
   git add .
   git commit -m "$MESSAGE";
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to continue: "
read CLOSE

