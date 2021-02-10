function fnEcho() {
    NO_COLOR="\033[0m"
    GRAY="\033[1;30m"
    RED="\033[1;31m"
    GREEN="\033[1;32m"
    YELLOW="\033[1;33m"
    BLUE="\033[1;34m"
    PURPLE="\033[1;35m"
    CYAN="\033[1;36m"
    WHITE="\033[1;37m"
    LIGHT_GRAY="\033[0;30m"
    LIGHT_RED="\033[0;31m"
    LIGHT_GREEN="\033[0;32m"
    LIGHT_YELLOW="\033[0;33m"
    LIGHT_BLUE="\033[0;34m"
    LIGHT_PURPLE="\033[0;35m"
    LIGHT_CYAN="\033[0;36m"
    LIGHT_WHITE="\033[0;37m"

    # NO_COLOR="\033[0m" # No Color
    # RED="\033[0;31m"
    # GREEN="\033[0;32m"
    # YELLOW="\033[1;33m"
    # CYAN="\033[1;36m"
    # LIGHT_GRAY="\e[37m"

    printf "${!1}${2} ${NO_COLOR}\n"
}

function fnCurrentBranch() {
    # printf "$(git symbolic-ref -q --short HEAD)"
    printf "$(git rev-parse --abbrev-ref HEAD)"
}

function fnClear() {
    printf "$(tput reset)"
}
