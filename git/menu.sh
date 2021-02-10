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
   fnEcho "LIGHT_GRAY" "#########################################"
   fnEcho "LIGHT_GRAY" "#                                       #"
   fnEcho "LIGHT_GRAY" "#          #####    #   #######         #"
   fnEcho "LIGHT_GRAY" "#         #         #      #            #"
   fnEcho "LIGHT_GRAY" "#         # #####   #      #            #"
   fnEcho "LIGHT_GRAY" "#         #     #   #      #            #"
   fnEcho "LIGHT_GRAY" "#          #####    #      #            #"
   fnEcho "LIGHT_GRAY" "#                                       #"
   fnEcho "LIGHT_GRAY" "#########################################"
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
      echo " h = commit + push"
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
         # Bloquear o commit na branch main/master
         BRANCH="$(git rev-parse --abbrev-ref HEAD)"
         if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
            fnEcho "YELLOW" "#######################################################"
            fnEcho "YELLOW" "#                                                     #"
            fnEcho "YELLOW" "# You shouldn't commit directly to main/master branch #"
            fnEcho "YELLOW" "#                                                     #"
            fnEcho "YELLOW" "#######################################################"
            echo ""
            echo -n "Are you sure? (y/n): "
            read CONFIRM
            if [ "$CONFIRM" = "y" ]; then
               gitCommit
            else
               echo ""
               echo -n "Enter to return to the menu: "
               read CLOSE
               fnClear
               gitMenu
            fi
         else
            gitCommit
         fi
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
      if [ "$VERSION_CONTROL" = "h" ]; then
         echo ""
         fnEcho "CYAN" "---------------------------------------"
         fnEcho "CYAN" " COMMIT + PUSH"
         fnEcho "CYAN" "---------------------------------------"
         # Bloquear o commit na branch main/master
         BRANCH="$(git rev-parse --abbrev-ref HEAD)"
         if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
            fnEcho "YELLOW" "#######################################################"
            fnEcho "YELLOW" "#                                                     #"
            fnEcho "YELLOW" "# You shouldn't commit directly to main/master branch #"
            fnEcho "YELLOW" "#                                                     #"
            fnEcho "YELLOW" "#######################################################"
            echo ""
            echo -n "Are you sure? (y/n): "
            read CONFIRM
            if [ "$CONFIRM" = "y" ]; then
               gitCommit
               # fnClear
               gitPush
            else
               echo ""
               echo -n "Enter to return to the menu: "
               read CLOSE
               # fnClear
               gitMenu
            fi
         else
            gitCommit
            # fnClear
            gitPush
         fi
      fi
      if [ "$OPTION" = "x" ]; then
         echo "Exiting..."
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
      echo " m = merge"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read BRANCH
      fnClear
      if [ "$BRANCH" = "n" ]; then
         echo ""
         gitNewbranch
      fi
      if [ "$BRANCH" = "d" ]; then
         echo ""
         gitDeletebranch
      fi
      if [ "$BRANCH" = "s" ]; then
         echo ""
         gitSwitchbranch
      fi
      if [ "$BRANCH" = "m" ]; then
         echo ""
         gitMerge
      fi
      if [ "$OPTION" = "x" ]; then
         echo "Exiting..."
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
         gitNewtag
      fi
      if [ "$TAG" = "d" ]; then
         echo ""
         gitDeleteTag
      fi
      if [ "$OPTION" = "x" ]; then
         echo "Exiting..."
      fi
   fi

   if [ "$OPTION" = "x" ]; then
      echo "Exiting..."
   fi
}

gitMenu