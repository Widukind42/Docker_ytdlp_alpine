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

# yt-dlp installieren mit curl-cffi wie beschrieben in https://github.com/yt-dlp/yt-dlp/issues/15273
RUN pip3 install -U --break-system-packages --no-cache-dir  "yt-dlp[default,curl-cffi]"


# Arbeitsverzeichnis festlegen
WORKDIR /out

# Standardbefehl: yt-dlp ausführen
ENTRYPOINT ["yt-dlp"]
