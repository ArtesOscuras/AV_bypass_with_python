#!/bin/bash

# Verifica si se proporcionó un argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <archivo_python>"
    exit 1
fi

# Extrae el nombre del archivo sin la extensión
filename=$(basename -- "$1")
name="${filename%.*}"

# Ejecuta pyinstaller y renombra el output
wine pyinstaller --onefile --clean --noconsole --icon=/scripts/icono.ico "$1"
mv "dist/$name.exe" .
rm -rf dist/ build/ "$name.spec"
rm "$name.py"
