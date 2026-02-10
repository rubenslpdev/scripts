#!/bin/bash

# Busca pacotes e permite seleção interativa
pkg=$(apt-cache search . | awk '{print $1}' | fzf \
    --header "SELETOR APT: [Enter] Instalar | [Esc] Sair" \
    --prompt "Buscar pacote: " \
    --preview 'apt-cache show {1}' \
    --preview-window=right:60%:wrap)

# Se algo foi selecionado, procede com a instalação
if [ -n "$pkg" ]; then
    echo "Preparando instalação de: $pkg"
    sudo apt install "$pkg"
else
    echo "Nenhum pacote selecionado."
fi
