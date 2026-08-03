# Basis-Image: Alpine Linux
FROM alpine:latest

# Paketquellen aktualisieren und Abhängigkeiten installieren
RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    curl \
    deno \
    ca-certificates \
    unzip \
    git \
    && pip3 install --break-system-packages --upgrade pip

# yt-dlp installieren
RUN pip3 install --break-system-packages yt-dlp


# Arbeitsverzeichnis festlegen
WORKDIR /out

# Standardbefehl: yt-dlp ausführen
ENTRYPOINT ["yt-dlp"]
