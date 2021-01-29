#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: EXECUTE MARGE                               # 
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
# $ sh git-merge.sh
#
echo "MERGE"
echo "--------------------------------------------------"
git branch
echo "--------------------------------------------------"
echo -n "Type the branch (from): "
read FROM
echo -n "Type the branch (to): "
read TO
if [ "$TO" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout $TO"
   echo -n "Enter to confirm: "
   read CONFIRM_1
   echo ""

   # Posicionar na branch que vai receber o merge
   git checkout "$TO";
   if [ "$FROM" != "" ]
   then
      echo ""
      echo "Commands:"
      echo "$ git merge $FROM"
      read CONFIRM_2
      echo -n "Enter to confirm: "
      echo ""

      git merge "$FROM"
      # Para finalizar é necessário realizar um push na branch de destino
      echo -n "Do you want to push to the target branch? (y/n): "
      read PUSH
      if [ "$PUSH" = "y" ]
      then
         echo ""
        ./git/git-push.sh
      fi
   else
      echo "Invalid parameter. Nothing to do."
   fi
else
   echo "Invalid parameter. Nothing to do."
fi
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

