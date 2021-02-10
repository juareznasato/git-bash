function fnEcho() {
    NC="\033[0m" # No Color
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[1;33m"
    CYAN="\033[1;36m"
    LIGHT_GRAY="\e[37m"
    printf "${!1}${2} ${NC}\n"
}

function fnCurrentBranch() {
    # printf "$(git symbolic-ref -q --short HEAD)"
    printf "$(git rev-parse --abbrev-ref HEAD)"
}

function fnClear() {
    printf "$(tput reset)"
}
