#!/usr/bin/env python3
"""
server.py — Servidor HTTP Ligero y Resiliente para MOVI WhatsApp PWA
===================================================================
Proyecto: 121026_IDS_MOVILNET_PWA_WHATSAPP
Gobernanza: Universal Best Practices Engineering Rule (Pilares I al VII)
Diseñado para operar en Render Cloud, Docker, VPS o Local (macOS/Linux/Windows).
"""

import os
import sys
from http.server import HTTPServer, SimpleHTTPRequestHandler


class PWAHTTPRequestHandler(SimpleHTTPRequestHandler):
    """Manejador HTTP con soporte CORS y caché optimizada."""

    def end_headers(self):
        # Cabeceras de seguridad y acceso universal
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "*")
        
        # Service worker y manifest sin caché dura para actualizaciones inmediatas
        if self.path.endswith("sw.js") or self.path.endswith("manifest.json"):
            self.send_header("Cache-Control", "no-cache, no-store, must-revalidate")
        else:
            self.send_header("Cache-Control", "public, max-age=3600")
            
        super().end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.end_headers()


def run_server():
    port = int(os.environ.get("PORT", 8080))
    host = "0.0.0.0"
    
    # Cambiar al directorio del script
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    server_address = (host, port)
    httpd = HTTPServer(server_address, PWAHTTPRequestHandler)
    print(f"========================================================================")
    print(f"📱 MOVI WhatsApp PWA Server iniciado en http://{host}:{port}")
    print(f"========================================================================")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 Servidor detenido limpiamente.")
        httpd.server_close()
        sys.exit(0)


if __name__ == "__main__":
    run_server()
