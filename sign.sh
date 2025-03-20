#!/bin/bash

# Nombre del ejecutable a firmar
EXE_ORIGINAL="$1"
EXE_FIRMADO="$EXE_ORIGINAL"

# Nombre del certificado y clave
CERT="certificado.pfx"
CERT_PASS="1234"  # Cambia esta contraseña

# Verifica si osslsigncode está instalado
if ! command -v osslsigncode &> /dev/null; then
    echo "❌ osslsigncode no está instalado. Instalándolo..."
    sudo apt update && sudo apt install osslsigncode -y
fi

# Paso 1: Crear un certificado autofirmado (si no existe)
if [ ! -f "$CERT" ]; then
    echo "🔹 Creando un certificado autofirmado..."
    openssl req -new -x509 -days 365 -nodes -out cert.pem -keyout clave.pem -subj "/CN=Mi Empresa"
    openssl pkcs12 -export -out "$CERT" -inkey clave.pem -in cert.pem -passout pass:$CERT_PASS
    echo "✅ Certificado creado: $CERT"
else
    echo "✅ Certificado ya existe: $CERT"
fi

# Paso 2: Firmar el ejecutable
if [ -f "$EXE_ORIGINAL" ]; then
    echo "🔹 Firmando $EXE_ORIGINAL..."
    osslsigncode sign -pkcs12 "$CERT" -pass "$CERT_PASS" -n "Mi Programa" -i "https://miweb.com" \
    -ts http://timestamp.digicert.com -in "$EXE_ORIGINAL" -out "temp_signed.exe"

    # Reemplazar el original con el firmado
    mv "temp_signed.exe" "$EXE_ORIGINAL"

    echo "✅ Firma completada. Archivo firmado: $EXE_ORIGINAL"
else
    echo "❌ No se encontró $EXE_ORIGINAL. Asegúrate de que el archivo existe."
fi

# Limpieza:
rm cert.pem
rm certificado.pfx
rm clave.pem
