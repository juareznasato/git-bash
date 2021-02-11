#!/bin/bash
#
# --> COMMAND <--
# $ sh gnome-terminal.sh
#
# criar um link simbólico no diretorio versionado
# $ ln -s /home/juarez/deposito/frontech-arquivo/git/versao_2 git
# Remover link simbólico
# unlink git

# ignore:
# /git
# *.sh

# aliases
# $ git config --global alias.s status
# $ git config --global alias.l log

# Abrir no terminal atual
# ./git/menu.sh
# --Obter o diretorio atual
# echo "$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"
# --Abrir o gnome-terminal em um diretorio especifico
# gnome-terminal --working-directory=/home/juarez/deposito/workspace/ws-vscode/vue-felix-2-b
# --Abrir o gnome-terminal no diretorio atual
# gnome-terminal --working-directory="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" 
# --Abrir o gnome-terminal no diretorio atual, executar um arquivo bash e fechar o terminal
gnome-terminal --working-directory="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" -- sh "./git/start.sh"
# --Abrir o gnome-terminal no diretorio atual, executar um arquivo bash e manter o terminal aberto.
# gnome-terminal --working-directory="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" -- bash -c "./git/controle.sh; bash"

