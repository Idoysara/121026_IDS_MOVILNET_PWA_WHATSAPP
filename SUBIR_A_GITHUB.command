#!/bin/bash
# ==============================================================================
# SUBIR_A_GITHUB.command — Publicador en GitHub (121026_IDS_MOVILNET_PWA_WHATSAPP)
# Proyecto: MOVI WhatsApp PWA — Telecomunicaciones Movilnet C.A.
# Gobernanza: Universal Best Practices Engineering Rule (Pilar VII: Cero Terminal)
# ==============================================================================

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

clear
echo "========================================================================"
echo "🚀 PUBLICADOR EN GITHUB — REPOSITORIO INDEPENDIENTE PWA WHATSAPP"
echo "========================================================================"
echo "📡 Destino: https://github.com/Idoysara/121026_IDS_MOVILNET_PWA_WHATSAPP"
echo "🌿 Rama   : main"
echo "========================================================================"
echo ""

# 1. Inicializar repositorio Git local si no existe
if [ ! -d ".git" ]; then
    echo "📦 Inicializando repositorio Git local..."
    git init -b main
    git config user.name "Idoysara"
    git config user.email "idoysara@gmail.com"
fi

# 2. Configurar remote origin
REPO_URL="https://github.com/Idoysara/121026_IDS_MOVILNET_PWA_WHATSAPP.git"
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"

# 3. Preparar archivos para commit
echo "📦 Agregando archivos del proyecto..."
git add .
git commit -m "feat(pwa): lanzamiento oficial de PWA nativa WhatsApp MOVI 4GMAX" 2>/dev/null || true

echo "🔄 Intentando subir a GitHub..."
git push -u origin main 2>/dev/null

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================================================"
    echo "🎉 ¡SUBIDA COMPLETADA CON ÉXITO A GITHUB!"
    echo "========================================================================"
    echo "🔗 Repositorio: https://github.com/Idoysara/121026_IDS_MOVILNET_PWA_WHATSAPP"
    echo "🌐 GitHub Pages: https://idoysara.github.io/121026_IDS_MOVILNET_PWA_WHATSAPP/"
    echo "========================================================================"
    echo ""
    read -p "Presiona ENTER para finalizar..."
    exit 0
fi

echo ""
echo "⚠️  GitHub requiere autenticación mediante Personal Access Token (PAT)."
echo "------------------------------------------------------------------------"
echo "1. Asegúrate de haber creado el repositorio en GitHub:"
echo "   👉 https://github.com/new"
echo "   Nombre del repositorio: 121026_IDS_MOVILNET_PWA_WHATSAPP"
echo ""
echo "2. Si ya tienes tu Token de GitHub (empieza por ghp_...):"
echo -n "Pega tu GitHub Token aquí (o presiona ENTER para omitir): "
read GITHUB_TOKEN

if [ -n "${GITHUB_TOKEN}" ]; then
    echo ""
    echo "🚀 Subiendo con token a GitHub..."
    git push "https://${GITHUB_TOKEN}@github.com/Idoysara/121026_IDS_MOVILNET_PWA_WHATSAPP.git" main
    if [ $? -eq 0 ]; then
        echo ""
        echo "========================================================================"
        echo "🎉 ¡SUBIDA COMPLETADA CON ÉXITO A GITHUB!"
        echo "========================================================================"
        echo "🔗 Repositorio: https://github.com/Idoysara/121026_IDS_MOVILNET_PWA_WHATSAPP"
        echo "🌐 GitHub Pages: https://idoysara.github.io/121026_IDS_MOVILNET_PWA_WHATSAPP/"
        echo "========================================================================"
    else
        echo ""
        echo "❌ No se pudo subir. Verifica que el repositorio exista en GitHub y el token sea válido."
    fi
else
    echo ""
    echo "ℹ️  Puedes ejecutar este script nuevamente cuando tengas tu token listo."
fi

echo ""
read -p "Presiona ENTER para salir..."
