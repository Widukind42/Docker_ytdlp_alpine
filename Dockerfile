# Basis-Image: Alpine Linux
FROM alpine:3.24

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
    && pip3 install --break-system-packages --no-cache-dir --upgrade pip

# yt-dlp installieren mit curl-cffi wie beschrieben in https://github.com/yt-dlp/yt-dlp/issues/15273
# Inserted "--pre" as describes in https://github.com/yt-dlp/yt-dlp/issues/17456#issuecomment-5325954656
RUN pip3 install --pre --break-system-packages --no-cache-dir --upgrade "yt-dlp[default,curl-cffi]"


# Arbeitsverzeichnis festlegen
WORKDIR /out

# Standardbefehl: yt-dlp ausführen
ENTRYPOINT ["yt-dlp"]
