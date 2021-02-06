#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: DELETE LAST LOCAL COMMIT                    # 
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
# $ sh git-rollback.sh
# --> OBJETIVO <--
# Excluir o último commit da árvore desfazendo todas as alterações 
# até o workspace (--hard).
# --> OBSERVACAO <--
# Deve ser utilizado somente em commits que ainda não tenham sido 
# enviados para o repositório remoto via comando push. Isso poderia
# resultar em diferenças entre o repositório local e o remoto,
# inutilizando o repositório local.
#
echo "----------------------------------------"
echo " ROLLBACK"
echo "----------------------------------------"
git log --pretty=oneline
echo ""
echo -n "Do you want to delete the last commit? (y/n): "
read VAR

if [ "$VAR" = "y" ]
then
   echo ""
   echo "Commands:"
   echo "$ git reset HEAD~1 --hard"
   echo ""
   echo -n "Enter to confirm: "
   read CONFIRM
   echo ""

   git reset HEAD~1 --hard
   echo "Last commit deleted."
else
   echo "Invalid parameter. Nothing to do."
fi
echo ""
echo -n "Enter to return to the menu: "
read CLOSE
clear
./git/menu.sh

