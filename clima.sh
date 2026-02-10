#!/bin/bash

# Defina os caminhos absolutos
PROJETO_DIR="/home/santopo/Documents/Projetos/Python/clima"
PYTHON_VENV="$PROJETO_DIR/.venv/bin/python3"
SCRIPT_PY="$PROJETO_DIR/clima.py"

# Verifica se o executável do venv existe antes de rodar
if [ -f "$PYTHON_VENV" ]; then
    "$PYTHON_VENV" "$SCRIPT_PY"
else
    echo "Erro: Ambiente virtual não encontrado em $PYTHON_VENV"
fi