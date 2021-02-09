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
   tput reset
   echoc "LIGHT_GRAY" "#########################################"
   echoc "LIGHT_GRAY" "#                                       #"
   echoc "LIGHT_GRAY" "#          #####    #   #######         #"
   echoc "LIGHT_GRAY" "#         #         #      #            #"
   echoc "LIGHT_GRAY" "#         # #####   #      #            #"
   echoc "LIGHT_GRAY" "#         #     #   #      #            #"
   echoc "LIGHT_GRAY" "#          #####    #      #            #"
   echoc "LIGHT_GRAY" "#                                       #"
   echoc "LIGHT_GRAY" "#########################################"
   echo ""
   echo " v = version control"
   echo " b = branch"
   echo " t = tag"
   echo " x = exit"
   echo ""
   echo -n " Type option: "
   read OPTION
   tput reset
   if [ "$OPTION" = "v" ]; then
      echo "---------------------------------------"
      echo " VERSION CONTROL"
      echo "---------------------------------------"
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
      tput reset
      if [ "$VERSION_CONTROL" = "u" ]; then
         echo ""
         gitUndo
      fi
      if [ "$VERSION_CONTROL" = "c" ]; then
         # Bloquear o commit na branch main/master
         BRANCH="$(git rev-parse --abbrev-ref HEAD)"
         if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
            echoc "YELLOW" "#######################################################"
            echoc "YELLOW" "#                                                     #"
            echoc "YELLOW" "# You shouldn't commit directly to main/master branch #"
            echoc "YELLOW" "#                                                     #"
            echoc "YELLOW" "#######################################################"
            echo ""
            echo -n "Are you sure? (y/n): "
            read CONFIRM
            if [ "$CONFIRM" = "y" ]; then
               gitCommit
            else
               echo ""
               echo -n "Enter to return to the menu: "
               read CLOSE
               tput reset
               ./git/menu.sh
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
         echo "---------------------------------------"
         echo " COMMIT + PUSH"
         echo "---------------------------------------"
         # Bloquear o commit na branch main/master
         BRANCH="$(git rev-parse --abbrev-ref HEAD)"
         if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
            echoc "YELLOW" "#######################################################"
            echoc "YELLOW" "#                                                     #"
            echoc "YELLOW" "# You shouldn't commit directly to main/master branch #"
            echoc "YELLOW" "#                                                     #"
            echoc "YELLOW" "#######################################################"
            echo ""
            echo -n "Are you sure? (y/n): "
            read CONFIRM
            if [ "$CONFIRM" = "y" ]; then
               gitCommit
               tput reset
               gitPush
            else
               echo ""
               echo -n "Enter to return to the menu: "
               read CLOSE
               tput reset
               ./git/menu.sh
            fi
         else
            gitCommit
            tput reset
            gitPush
         fi
      fi
      if [ "$OPTION" = "x" ]; then
         echo "Exiting..."
      fi
   fi

   if [ "$OPTION" = "b" ]; then
      echo ""
      echo "---------------------------------------"
      echo " BRANCH"
      echo "---------------------------------------"
      echo " n = new-branch"
      echo " d = delete-branch"
      echo " s = switch-branch"
      echo " m = merge"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read BRANCH
      tput reset
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
      echo "---------------------------------------"
      echo " TAG"
      echo "---------------------------------------"
      echo " n = new-tag"
      echo " d = delete-tag"
      echo " x = exit"
      echo ""
      echo -n " Type option: "
      read TAG
      tput reset
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