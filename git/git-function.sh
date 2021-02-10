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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " COMMIT"
   echoc "CYAN" "----------------------------------------"
   BRANCH="$(fnCurrentBranch)"
   if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
      echoc "YELLOW" "#######################################################"
      echoc "YELLOW" "#                                                     #"
      echoc "YELLOW" "# You shouldn't commit directly to main/master branch #"
      echoc "YELLOW" "#                                                     #"
      echoc "YELLOW" "#######################################################"
      echo ""
      echo -n "Are you sure? (y/n): "
      read CONFIRM
      if [ "$CONFIRM" != "y" ]; then
         gitMenu
      fi
   fi
   echo ""
   git status
   echo ""
   echo -n "Message: "
   read MESSAGE
   if [ "$MESSAGE" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git add ."
      echoc "CYAN" "$ git commit -m $MESSAGE"
      echo ""
      echo -n "Enter to confirm: "
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
   tput reset
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
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git checkout $MAIN_BRANCH"
      echoc "CYAN" "$ git push origin $BRANCH --delete"
      echoc "CYAN" "$ git branch -D $BRANCH"
      echo ""
      echo -n "Enter to confirm: "
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" "DELETE-TAG"
   echoc "CYAN" "----------------------------------------"
   git tag
   echo ""
   echo -n "Type tag: "
   read TAG

   if [ "$TAG" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git push origin $TAG --delete"
      echoc "CYAN" "$ git tag -d $TAG"
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
   tput reset
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
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git checkout $TO"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM_1
      echo ""
      # Posicionar na branch que vai receber o merge
      git checkout "$TO"
      if [ "$FROM" != "" ]; then
         echo ""
         echoc "CYAN" "Commands:"
         echoc "CYAN" "$ git merge $FROM"
         echo ""
         echo -n "Enter to confirm: "
         read CONFIRM_2
         echo ""
         git merge "$FROM"
         echo ""
         gitPush
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " NEW-BRANCH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH
   if [ "$BRANCH" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git checkout -b $BRANCH"
      echoc "CYAN" "$ git push origin $BRANCH"
      echo ""
      echo -n "Enter to confirm: "
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
   tput reset
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
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git tag -a $TAG -m $MESSAGE"
      echoc "CYAN" "$ git push origin $TAG"
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " PULL"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   default="$(fnCurrentBranch)"
   read -p "Type branch [$default]: " VAR
   : ${VAR:=$default}
   if [ "$VAR" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git pull origin $VAR"
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " PUSH"
   echoc "CYAN" "----------------------------------------"
   BRANCH="$(fnCurrentBranch)"
   if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
      echoc "YELLOW" "#######################################################"
      echoc "YELLOW" "#                                                     #"
      echoc "YELLOW" "#  You shouldn't push directly to main/master branch  #"
      echoc "YELLOW" "#                                                     #"
      echoc "YELLOW" "#######################################################"
      echo ""
      echo -n "Are you sure? (y/n): "
      read CONFIRM
      if [ "$CONFIRM" != "y" ]; then
         gitMenu
      fi
   fi
   echo ""
   git branch
   echo ""
   default="$(fnCurrentBranch)"
   read -p "Type branch [$default]: " VAR
   : ${VAR:=$default}
   if [ "$VAR" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git pull origin $VAR"
      echoc "CYAN" "$ git push origin $VAR"
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " ROLLBACK"
   echoc "CYAN" "----------------------------------------"
   git log --pretty=oneline
   echo ""
   echo -n "Do you want to delete the last commit? (y/n): "
   read VAR
   if [ "$VAR" = "y" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git reset HEAD~1 --hard"
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " SWITCH-BRANCH"
   echoc "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH
   if [ "$BRANCH" != "" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git checkout $BRANCH"
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
   tput reset
   echoc "CYAN" "----------------------------------------"
   echoc "CYAN" " UNDO"
   echoc "CYAN" "----------------------------------------"
   git status
   echo ""
   echo -n "Discard all changes? (y/n): "
   read UNDO
   if [ "$UNDO" = "y" ]; then
      echo ""
      echoc "CYAN" "Commands:"
      echoc "CYAN" "$ git checkout ."
      echoc "CYAN" "$ git clean -fd"
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
