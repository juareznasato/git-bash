#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: DELETE BRANCH                               # 
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
# $ sh git-deletebranch.sh
# Faz a exclusão remota e depois local
#
echo "DELETE-BRANCH"
echo "--------------------------------------------------"
git branch
echo "--------------------------------------------------"
echo -n "Type the branch: "
read BRANCH

default="main"
read -p "switch to main branch [$default]: " MAIN_BRANCH
: ${MAIN_BRANCH:=$default}

if [[ ("$BRANCH" != "") && ("$BRANCH" != "main") && ("$BRANCH" != "master") && ("$MAIN_BRANCH" != "") ]]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout $MAIN_BRANCH"
   echo "$ git push origin $BRANCH --delete"
   echo "$ git branch -D $BRANCH"
   echo -n "Enter to continue: "
   read CONFIRM
   echo ""

   # Posicionar na branch main para liberar a branch que será excluida
   git checkout "$MAIN_BRANCH"
   # Deletar a branch remota
   git push origin "$BRANCH" --delete
   # Deletar a branch local
   git branch -D "$BRANCH"
   echo "Branch $BRANCH deleted from remote and local repository."
else
   echo "Invalid parameter. Nothing to do."
fi
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

