#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: DELETE REMOTE AND LOCAL TAG                 # 
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
# $ sh git-deletetag.sh
# Faz a exclusão remota e depois local
#
echo "----------------------------------------"
echo "DELETE-TAG"
echo "----------------------------------------"
git tag
echo ""
echo -n "Type tag: "
read TAG

if [ "$TAG" != "" ]
then
   echo ""
   echo "Commands:"
   echo "$ git push origin $TAG --delete"
   echo "$ git tag -d $TAG"
   echo ""
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   # Deletar a tag remota
   git push origin "$TAG" --delete
   # Deletar a tag local
   git tag -d "$TAG"
   echo "Tag $TAG deleted from remote and local repository."
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

