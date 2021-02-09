#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: Git Commands                                #
#------------------------------------------------------------------- #
#                                                                    #
#       AUTHOR:  Juarez Nasato                                       #
#       EMAIL:   juareznasato@gmail.com                              #
#       CREATED: 02/01/2021                                          #
#       VERSION: 2.0.0                                               #
#                                                                    #
######################################################################
#
function gitCommit() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " COMMIT"
   echoc "CYAN" "----------------------------------------"
   git status
   echo ""
   echo -n "Message: "
   read MESSAGE
   if [ "$MESSAGE" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git add ."
      echo "$ git commit -m $MESSAGE"
      echo ""
      echo -n "Enter to continue: "
      read CONFIRM
      echo ""
      git add .
      git commit -m "$MESSAGE"
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to continue: "
   read MENU
}

function gitDeleteBranch() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " DELETE-BRANCH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH

   default="main"
   read -p "switch to main branch [$default]: " MAIN_BRANCH
   : ${MAIN_BRANCH:=$default}

   if [[ ("$BRANCH" != "") && ("$BRANCH" != "main") && ("$BRANCH" != "master") && ("$MAIN_BRANCH" != "") ]]; then
      echo ""
      echo "Commands:"
      echo "$ git checkout $MAIN_BRANCH"
      echo "$ git push origin $BRANCH --delete"
      echo "$ git branch -D $BRANCH"
      echo ""
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
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitDeleteTag() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" "DELETE-TAG"
   echoc "CYAN" "----------------------------------------"
   git tag
   echo ""
   echo -n "Type tag: "
   read TAG

   if [ "$TAG" != "" ]; then
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
   read MENU
   gitMenu
}

function gitMerge() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " MERGE"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch (from): "
   read FROM
   echo -n "Type branch (to): "
   read TO
   if [ "$TO" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git checkout $TO"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM_1
      echo ""
      # Posicionar na branch que vai receber o merge
      git checkout "$TO"
      if [ "$FROM" != "" ]; then
         echo ""
         echo "Commands:"
         echo "$ git merge $FROM"
         read CONFIRM_2
         echo ""
         echo -n "Enter to confirm: "
         echo ""
         git merge "$FROM"
         # Para finalizar é necessário realizar um push na branch de destino
         # echo -n "Do you want to push to the target branch? (y/n): "
         #read PUSH
         #if [ "$PUSH" = "y" ]
         #then
         echo ""
         ./git/git-push.sh
         #fi
      else
         echo "Invalid parameter. Nothing to do."
      fi
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitNewBranch() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " NEW-BRANCH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH

   if [ "$BRANCH" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git checkout -b $BRANCH"
      echo "$ git push origin $BRANCH"
      echo ""
      echo -n "Enter to continue: "
      read CONFIRM
      echo ""

      git checkout -b "$BRANCH"
      git push origin "$BRANCH"
      echo "Branch $BRANCH created."
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitNewTag() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " NEW-TAG"
   echoc "CYAN" "----------------------------------------"
   git tag
   echo ""
   echo -n "Type tag: "
   read TAG
   echo -n "Message: "
   read MESSAGE

   if [[ ("$TAG" != "") && ("$MESSAGE" != "") ]]; then
      echo ""
      echo "Commands:"
      echo "$ git tag -a $TAG -m $MESSAGE"
      echo "$ git push origin $TAG"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""

      git tag -a "$TAG" -m "$MESSAGE"
      git push origin "$TAG"
      echo "Tag $TAG created."
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitPull() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " PULL"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   # default=""
   default=$(git symbolic-ref -q --short HEAD)
   read -p "Type branch [$default]: " VAR
   : ${VAR:=$default}
   if [ "$VAR" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git pull origin $VAR"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""

      git pull origin "$VAR"
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitPush() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " PUSH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   default=$(git symbolic-ref -q --short HEAD)
   read -p "Type branch [$default]: " VAR
   : ${VAR:=$default}
   if [ "$VAR" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git pull origin $VAR"
      echo "$ git push origin $VAR"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""
      git pull origin "$VAR"
      git push origin "$VAR"
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitRollback() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " ROLLBACK"
   echoc "CYAN" "----------------------------------------"
   git log --pretty=oneline
   echo ""
   echo -n "Do you want to delete the last commit? (y/n): "
   read VAR

   if [ "$VAR" = "y" ]; then
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
   read MENU
   gitMenu
}

function gitSwitchBranch() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " SWITCH-BRANCH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH

   if [ "$BRANCH" != "" ]; then
      echo ""
      echo "Commands:"
      echo "$ git checkout $BRANCH"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""

      git checkout "$BRANCH"
      # echo "Switched to branch $BRANCH."
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitUndo() {
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " UNDO"
   echoc "CYAN" "----------------------------------------"
   git status
   echo ""
   echo -n "Discard all changes? (y/n): "
   read UNDO

   if [ "$UNDO" = "y" ]; then
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
   read MENU
   gitMenu
}
