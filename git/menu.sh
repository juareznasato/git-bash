#!/bin/bash
#
######################################################################
#       SCRIPT FUNCTION: Menu                                        #
#------------------------------------------------------------------- #
#                                                                    #
#       AUTHOR:  Juarez Nasato                                       #
#       EMAIL:   juareznasato@gmail.com                              #
#       CREATED: 02/01/2021                                          #
#       VERSION: 2.0.0                                               #
#                                                                    #
######################################################################
#
source ./git/git-function.sh
source ./git/util.sh

function gitMenu() {
   fnClear
   fnEcho "WHITE" "#########################################"
   fnEcho "WHITE" "#                                       #"
   fnEcho "WHITE" "#          #####    #   #######         #"
   fnEcho "WHITE" "#         #         #      #            #"
   fnEcho "WHITE" "#         # #####   #      #            #"
   fnEcho "WHITE" "#         #     #   #      #            #"
   fnEcho "WHITE" "#          #####    #      #            #"
   fnEcho "WHITE" "#                                       #"
   fnEcho "WHITE" "#########################################"
   echo ""
   echo " v = version control"
   echo " b = branch"
   echo " t = tag"
   echo " x = exit"
   echo ""
   echo -n " Type option: "
   read OPTION
   fnClear
   if [ "$OPTION" = "v" ]; then
      fnEcho "CYAN" "---------------------------------------"
      fnEcho "CYAN" " VERSION CONTROL"
      fnEcho "CYAN" "---------------------------------------"
      echo " u = undo"
      echo " c = commit"
      echo " r = rollback"
      echo " l = pull"
      echo " p = push"
      echo " f = commit + push"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read VERSION_CONTROL
      fnClear
      if [ "$VERSION_CONTROL" = "u" ]; then
         echo ""
         gitUndo
      fi
      if [ "$VERSION_CONTROL" = "c" ]; then
         echo ""
         gitCommit
      fi
      if [ "$VERSION_CONTROL" = "r" ]; then
         echo ""
         gitRollback
      fi
      if [ "$VERSION_CONTROL" = "l" ]; then
         echo ""
         gitPull
      fi
      if [ "$VERSION_CONTROL" = "p" ]; then
         echo ""
         gitPush
      fi
      if [ "$VERSION_CONTROL" = "f" ]; then
         echo ""
         gitCommitPush
      fi
      if [ "$OPTION" = "x" ]; then
         exit
      fi
   fi

   if [ "$OPTION" = "b" ]; then
      echo ""
      fnEcho "CYAN" "---------------------------------------"
      fnEcho "CYAN" " BRANCH"
      fnEcho "CYAN" "---------------------------------------"
      echo " n = new-branch"
      echo " d = delete-branch"
      echo " s = switch-branch"
      echo " c = compare branchs"
      echo " m = merge"
      echo " a = abort merge"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read BRANCH
      fnClear
      if [ "$BRANCH" = "n" ]; then
         echo ""
         gitNewBranch
      fi
      if [ "$BRANCH" = "d" ]; then
         echo ""
         gitDeleteBranch
      fi
      if [ "$BRANCH" = "s" ]; then
         echo ""
         gitSwitchBranch
      fi
      if [ "$BRANCH" = "c" ]; then
         echo ""
         gitCompareBranch
      fi
      if [ "$BRANCH" = "m" ]; then
         echo ""
         gitMerge
      fi
      if [ "$BRANCH" = "a" ]; then
         echo ""
         gitAbortMerge
      fi
      if [ "$OPTION" = "x" ]; then
         exit
      fi
   fi

   if [ "$OPTION" = "t" ]; then
      echo ""
      fnEcho "CYAN" "---------------------------------------"
      fnEcho "CYAN" " TAG"
      fnEcho "CYAN" "---------------------------------------"
      echo " n = new-tag"
      echo " d = delete-tag"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read TAG
      fnClear
      if [ "$TAG" = "n" ]; then
         echo ""
         gitNewTag
      fi
      if [ "$TAG" = "d" ]; then
         echo ""
         gitDeleteTag
      fi
      if [ "$OPTION" = "x" ]; then
         exit
      fi
   fi

   if [ "$OPTION" = "x" ]; then
      exit
   fi
}

gitMenu