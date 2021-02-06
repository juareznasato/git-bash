#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: UNDO CHANGES                                # 
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
# $ sh git-undo.sh
# --> OBJETIVO <--
# Desfazer alterações primárias igualando ao último commit.
# --> DESCRICÃO <--
# git checkout . -- Desfaz alterações em arquivos versionados. Iguala ao último commit
# git clean -fd  --Remove arquivos e diretórios não versionados
#
echo "----------------------------------------"
echo " UNDO"
echo "----------------------------------------"
git status
echo ""
echo -n "Discard all changes? (y/n): "
read UNDO

if [ "$UNDO" = "y" ]
then
   echo ""
   echo "Commands:"
   echo "$ git checkout ."
   echo "$ git clean -fd"
   echo ""
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git checkout .
   git clean -fd
   echo "Discarded changes."
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh


