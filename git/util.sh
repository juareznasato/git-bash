function echoc() {
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[1;33m"
    CYAN="\033[1;36m"
    LIGHT_GRAY="\e[37m"
    # ... ADD MORE COLORS
    NC="\033[0m" # No Color

    printf "${!1}${2} ${NC}\n"
}

function fnCurrentBranch() {
    # printf "$(git symbolic-ref -q --short HEAD)"
    printf "$(git rev-parse --abbrev-ref HEAD)"
}
