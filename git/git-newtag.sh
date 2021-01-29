#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: CREATE TAG                                  # 
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
# $ sh git-newtag.sh
#
echo "NEW-TAG"
echo "--------------------------------------------------"
git tag
echo "--------------------------------------------------"
echo -n "Type the tag: "
read TAG
echo -n "Message: "
read MESSAGE

if [[ ("$TAG" != "")  &&  ("$MESSAGE" != "") ]]
then
   echo ""
   echo "Commands:"
   echo "$ git tag -a $TAG -m $MESSAGE"
   echo "$ git push origin $TAG"
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git tag -a "$TAG" -m "$MESSAGE"
   git push origin "$TAG";
   echo "Tag $TAG created."
else
   echo "Invalid parameter. Nothing to do."
fi
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

