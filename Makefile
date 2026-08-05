# including my config file with private dev and username
include ../.config/Makefile

# Variablen definieren
REPO := Docker_ytdlp_alpine
IMAGE_NAME := ytdlp_alpine
CONTAINER_NAME := ytdlp_alpine_container
DOCKERFILE := Dockerfile
#COMPOSE_FILE := docker-compose.yml

.PHONY: help

# Standardziel: Hilfe anzeigen
help:  ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
# PODMAN TASKS
# Image bauen
build:  ## Image bauen
	podman build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

# Container starten
run:    ## Container starten
	podman run --rm -it -v "$(pwd):/out:z" $(IMAGE_NAME) --config-locations ./youtube_config/

# Container stoppen
stop:   ## Container stop. Normaler Weise endet er nachdem yt-dlp die Arbeit erledigt hat
	podman stop $(CONTAINER_NAME)

# Container entfernen
rm:     ## Container manuell löschen, falls sie nicht gelöscht werden, z.B. bei einem Abbruch
	podman rm -f $(CONTAINER_NAME)

# Image und Container bereinigen
clean:  ## Image und Container bereinigen
	podman rmi -f $(IMAGE_NAME)

# Shell im Container öffnen
shell:  ## Shell im Container öffnen
	podman run --rm -it --entrypoint /bin/sh $(IMAGE_NAME)
# Logs des Containers anzeigen
logs:   # Logs des Containers anzeigen
	podman logs $(CONTAINER_NAME)
