#!/bin/bash

# Lista apenas pacotes instalados (ii) e extrai o nome
pkg=$(dpkg -l | grep '^ii' | awk '{print $2}' | fzf \
    --header "REMOVER PACOTE: [Enter] Confirmar | [Esc] Sair" \
    --prompt "Buscar instalado: " \
    --preview 'apt-cache show {1}' \
    --preview-window=right:60%:wrap)

# Se algo foi selecionado, procede com a remoção
if [ -n "$pkg" ]; then
    echo "Removendo: $pkg"
    sudo apt remove --purge "$pkg"
else
    echo "Operação cancelada."
fi
