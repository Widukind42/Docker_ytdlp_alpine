#!/bin/bash
OUTFILENAME="PackageInventory.md"
THISPACKAGE="ghcr.io/widukind42/ytdlp_alpine"
# Container-Infos in eine Datei schreiben
echo "### Package Inventory (Stand: $(date +"%Y-%m-%d"))" > $OUTFILENAME
echo "" >> $OUTFILENAME
podman run --rm -v "$(pwd):/out:z" --entrypoint /bin/sh ghcr.io/widukind42/ytdlp_alpine /out/show-container-releases.sh >> $OUTFILENAME
echo "" >> $OUTFILENAME
