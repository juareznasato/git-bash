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
function gitUndo() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " UNDO"
   fnEcho "CYAN" "----------------------------------------"
   git status
   echo ""
   # echo -e "\033[33;36m Color Text" - Cyan
   # echo -n "Discard all changes? (y/n): "
   fnEcho "YELLOW" "Discard all changes? (y/n): " 
   echo -n
   read UNDO
   if [ "$UNDO" = "y" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git checkout ."
      fnEcho "CYAN" "$ git clean -fd"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""
      git checkout .
      git clean -fd
      echo "Discarded changes."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitCommit() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " COMMIT"
   fnEcho "CYAN" "----------------------------------------"
   BRANCH="$(fnCurrentBranch)"
   if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
      fnEcho "YELLOW" "#######################################################"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#  It's not recommended to commit directly to main or #"
      fnEcho "YELLOW" "#  master branch.                                     #"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#######################################################"
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
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git add ."
      fnEcho "CYAN" "$ git commit -m $MESSAGE"
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
   gitMenu
}

function gitPush() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " PUSH"
   fnEcho "CYAN" "----------------------------------------"
   BRANCH="$(fnCurrentBranch)"
   if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
      fnEcho "YELLOW" "#######################################################"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#  It's not recommended to push directly to main or   #"
      fnEcho "YELLOW" "#  master branch.                                     #"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#######################################################"
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
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git pull origin $VAR"
      fnEcho "CYAN" "$ git push origin $VAR"
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

function gitCommitPush() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " COMMIT + PUSH"
   fnEcho "CYAN" "----------------------------------------"
   BRANCH="$(fnCurrentBranch)"
   if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
      fnEcho "YELLOW" "#######################################################"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#  It's not recommended to commit directly to main or #"
      fnEcho "YELLOW" "#  master branch.                                     #"
      fnEcho "YELLOW" "#                                                     #"
      fnEcho "YELLOW" "#######################################################"
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
   # Obter mensagem do commit
   echo -n "Commit Message: "
   read MESSAGE
   # Obter branch para o push
   default="$(fnCurrentBranch)"
   read -p "Type branch to push [$default]: " BRANCH
   : ${BRANCH:=$default}
   if [[ ("$MESSAGE" != "") && ("$BRANCH" != "") ]]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git add ."
      fnEcho "CYAN" "$ git commit -m $MESSAGE"
      fnEcho "CYAN" "$ git pull origin $BRANCH"
      fnEcho "CYAN" "$ git push origin $BRANCH"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""
      git add .
      git commit -m "$MESSAGE"
      git pull origin "$BRANCH"
      git push origin "$BRANCH"
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to continue: "
   read MENU
   gitMenu
}


function gitDeleteBranch() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " DELETE-BRANCH"
   fnEcho "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH

   default="main"
   read -p "switch to main branch [$default]: " MAIN_BRANCH
   : ${MAIN_BRANCH:=$default}

   if [[ ("$BRANCH" != "") && ("$BRANCH" != "main") && ("$BRANCH" != "master") && ("$MAIN_BRANCH" != "") ]]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git checkout $MAIN_BRANCH"
      fnEcho "CYAN" "$ git push origin $BRANCH --delete"
      fnEcho "CYAN" "$ git branch -D $BRANCH"
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
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" "DELETE-TAG"
   fnEcho "CYAN" "----------------------------------------"
   git tag
   echo ""
   echo -n "Type tag: "
   read TAG

   if [ "$TAG" != "" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git push origin $TAG --delete"
      fnEcho "CYAN" "$ git tag -d $TAG"
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
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " MERGE"
   fnEcho "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch (from): "
   read FROM
   echo -n "Type branch (to): "
   read TO
   if [[ ("$FROM" != "") && ("$TO" != "") ]]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git checkout $TO"
      fnEcho "CYAN" "$ git merge $FROM"
      fnEcho "CYAN" "$ git push origin $TO"
      echo ""
      echo -n "Enter to confirm: "
      read CONFIRM
      echo ""
      # Posicionar na branch que vai receber o merge
      git checkout "$TO"
      git merge "$FROM"
      git push origin "$TO"
      echo ""
   else
      echo "Invalid parameter. Nothing to do."
   fi
   echo ""
   echo -n "Enter to return to the menu: "
   read MENU
   gitMenu
}

function gitNewBranch() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " NEW-BRANCH"
   fnEcho "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH
   if [ "$BRANCH" != "" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git checkout -b $BRANCH"
      fnEcho "CYAN" "$ git push origin $BRANCH"
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
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " NEW-TAG"
   fnEcho "CYAN" "----------------------------------------"
   git tag
   echo ""
   echo -n "Type tag: "
   read TAG
   echo -n "Message: "
   read MESSAGE
   if [[ ("$TAG" != "") && ("$MESSAGE" != "") ]]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git tag -a $TAG -m $MESSAGE"
      fnEcho "CYAN" "$ git push origin $TAG"
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
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " PULL"
   fnEcho "CYAN" "----------------------------------------"
   git branch
   echo ""
   default="$(fnCurrentBranch)"
   read -p "Type branch [$default]: " VAR
   : ${VAR:=$default}
   if [ "$VAR" != "" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git pull origin $VAR"
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

function gitRollback() {
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " ROLLBACK"
   fnEcho "CYAN" "----------------------------------------"
   git log --pretty=oneline
   echo ""
   echo -n "Do you want to delete the last commit? (y/n): "
   read VAR
   if [ "$VAR" = "y" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git reset HEAD~1 --hard"
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
   fnClear
   fnEcho "CYAN" "----------------------------------------"
   fnEcho "CYAN" " SWITCH-BRANCH"
   fnEcho "CYAN" "----------------------------------------"
   git branch
   echo ""
   echo -n "Type branch: "
   read BRANCH
   if [ "$BRANCH" != "" ]; then
      echo ""
      fnEcho "CYAN" "Commands:"
      fnEcho "CYAN" "$ git checkout $BRANCH"
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
