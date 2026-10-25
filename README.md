# 📱 MOVI — WhatsApp Movilnet 4GMAX (PWA Standalone)
## Interfaz Nativa de WhatsApp Web/Móvil para Asistente MOVI 4GMAX

[![GitHub Pages](https://img.shields.io/badge/Deploy-GitHub%20Pages-brightgreen?logo=github)](https://idoysara.github.io/121026_IDS_MOVILNET_PWA_WHATSAPP/)
[![Render](https://img.shields.io/badge/Render-24%2F7%20Cloud-46E3B7?logo=render)](https://one21026-ids-movilnet-pwa-bxmz.onrender.com)
[![PWA](https://img.shields.io/badge/PWA-Standalone%20Ready-blue?logo=pwa)](./manifest.json)
[![License: MIT](https://img.shields.io/badge/License-Proprietary%20Movilnet-orange.svg)]()

Repositorio oficial e independiente de la **Progressive Web App (PWA)** estilo WhatsApp para **Telecomunicaciones Movilnet C.A.** Permite a los abonados de cualquier operadora (`0416`, `0426`, `0414`, `0424`, `0412`) interactuar con el Asistente Oficial **MOVI** a través de una interfaz conversacional 1:1 idéntica a WhatsApp, sin depender de pasarelas externas ni riesgos de bloqueo.

---

### ✨ Características Principales

* 🟢 **Cabecera Oficial WhatsApp:** Avatar de MOVI, insignia de verificación verde (`#00c980`) e indicador *"en línea"*.
* 🌌 **Fondo Dark Mode WhatsApp:** Patrón vectorial SVG auténtico con doodles de WhatsApp sobre fondo `#0b141a`.
* 💬 **Burbujas y Ticks Auténticos:** Mensajes verdes (`#005c4b`) con doble check azul de entrega (`✓✓`) y timestamps exactos.
* ⌨️ **Composer Ergonómico:** Barra de entrada con emojis 😊, selector de comprobantes bancarios C2P (+), y botón inteligente Micrófono (🎤) con Web Speech Recognition.
* 📑 **WhatsApp Flows (Bottom Sheets):** Hojas modales inferiores deslizantes para:
  * 💳 **Consulta de Saldo OCS & Megas**
  * 💸 **Recarga Pago Móvil C2P Interbancario**
  * 🍔 **Radar Cazador de Ofertas (200+ promociones activas en Caracas)**
* 🔊 **Web Audio API Synth:** Generación matemática en caliente de los sonidos nativos *pop* y *marimba ping* sin descargar archivos `.mp3`.
* ⚡ **Zero-PII & Seguridad Militar:** Cero cookies invasivas, cero almacenamiento en texto plano de datos bancarios.

---

### 🚀 Opciones de Despliegue

#### 1. GitHub Pages (Gratis 24/7 con HTTPS)
Este repositorio incluye un flujo de GitHub Actions (`.github/workflows/deploy-pages.yml`) que publica automáticamente la web en:
👉 `https://idoysara.github.io/121026_IDS_MOVILNET_PWA_WHATSAPP/`

Para activarlo en GitHub:
1. Ve a **Settings ➔ Pages** en tu repositorio.
2. En **Build and deployment ➔ Source**, selecciona **GitHub Actions**.
3. ¡Listo! Cada `git push` actualizará tu PWA automáticamente.

#### 2. Render Cloud (Servicio Web 24/7)
1. Conecta tu repositorio `121026_IDS_MOVILNET_PWA_WHATSAPP` en [Render.com](https://render.com).
2. Selecciona **Static Site** (o **Web Service** usando el `Dockerfile` incluido).
3. Public Directory: `./` (o comando: `python server.py`).

#### 3. Ejecución Local en 1-Clic (macOS)
Doble clic en:
```bash
./PROBAR_PWA_WHATSAPP.command
```
O ejecutando el servidor local:
```bash
python3 server.py
# Disponible en: http://localhost:8080
```

---

### 🌐 Conexión al Backend Core Movilnet
La PWA cuenta con un enrutador inteligente de API:
* Si se abre localmente (`localhost`, `127.0.0.1` o `file://`), se conecta automáticamente con la nube de producción 24/7 de Render:
  `https://one21026-ids-movilnet-pwa-bxmz.onrender.com`
* Si se aloja bajo un dominio corporativo, puede consumir directamente el backend proxy.

---

### 🏛️ Gobernanza
Desarrollado bajo la directiva **Universal Best Practices Engineering Rule** de Antigravity AI para **Telecomunicaciones Movilnet C.A.**
