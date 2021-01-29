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
echo -n "Informe branch origem: "
read FROM
echo -n "Informe branch destino: "
read TO
if [ "$TO" != "" ]
then
   echo ""
   echo "Comandos que serao executados:"
   echo "$ git checkout $TO"
   echo -n "Enter para confirmar: "
   read CONFIRM_1
   echo ""

   # Posicionar na branch que vai receber o merge
   git checkout "$TO";
   if [ "$FROM" != "" ]
   then
      echo ""
      echo "Comandos que serao executados:"
      echo "$ git merge $FROM"
      read CONFIRM_2
      echo -n "Enter para confirmar: "
      echo ""

      git merge "$FROM"
      # Para finalizar é necessário realizar um push na branch de destino
      echo -n "Direcionar para push na branch de destino? (s/n): "
      read PUSH
      if [ "$PUSH" = "s" ]
      then
         echo ""
        ./git/git-push.sh "merge" "$TO"
      fi
   else
      echo "Parametro origem invalido. Nada foi executado."
   fi
else
   echo "Parametro destino invalido. Nada foi executado."
fi
echo "Fim";
echo -n "Enter para voltar ao menu: "
read CLOSE
clear
./git/menu.sh

