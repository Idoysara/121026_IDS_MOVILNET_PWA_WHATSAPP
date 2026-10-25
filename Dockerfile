# Dockerfile — Contenedor Ultraligero para MOVI WhatsApp PWA
FROM python:3.11-alpine

WORKDIR /app

# Copiar archivos de la PWA
COPY . /app

# Exponer puerto dinámico de Render/Cloud Run
EXPOSE 8080

ENV PORT=8080
ENV PYTHONUNBUFFERED=1

CMD ["python", "server.py"]
