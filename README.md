yt-dlp
======
date: 2026-08-13

[`yt-dlp`][1] is a feature-rich command-line program to download videos from
<https://www.youtube.com/> and many other sites. It is a fork of the original [`youtube-dl`][2].

[`yt-dlp`][1] is a [`youtube-dl`][2] fork based on the now inactive [`yt-dlc`][5]. The main focus of yt-dlp is adding new features and patches while also keeping up to date with the original project.

Inspiration
===========
The project was originally inspired by [`tanja84dk/Docker-yt-dlp`][3]. I had used her container for a long time and loved it most of the time.

After receiving a warning that Python 3.10 is outdated and Deno became a recommended add-on, I started testing which amendments to her Dockerfile could fulfill my intended changes.
With some help from Mistral/Le Chat, I decided to switch to Alpine Linux.

Extensions to the Original Concept
==================================
In addition to updating the Python environment, I have added the deno and curl_cffi extensions recommended by yt-dlp.

Used Images
===========
see `Dockerfile`

## Tutorial

```sh
podman run --rm -it -v "\$(pwd):/out" Widukind42/ytdlp_alpine [URL|(yt-dlp parameters)]

# With SELinux in place:
podman run --rm -it -v "\$(pwd):/out:z" Widukind42/ytdlp_alpine [URL|(yt-dlp parameters)]
```
/out is the working directory.
To build this image via Podman, enter the following command in the directory where the Dockerfile is stored:
```sh
podman build -t ytdlp_alpine .
```
Here’s an example of how I use it myself:
```sh
podman run --rm -it -v "$(pwd):/out:z" ytdlp_alpine --config-locations ./yt_config/
```
The directory yt_config holds the yt-dlp.conf file and an input URLs text file.

## Link of the image
`ghcr.io/widukind42/ytdlp_alpine`

## Package Inventory
Release informations of the used software in the currect image are listed in [`PackageInventory.md`][4].

## Credits
 - Credit to [`youtube-dl`][2] for the original project Licensed under [`The Unlicense`][7]
 - Credit to [`yt-dlp`][1] for their updated fork of youtube-dl Licensed under [`The Unlicense`][6]
 


[1]: https://github.com/yt-dlp/yt-dlp
[2]: https://ytdl-org.github.io/youtube-dl/
[3]: https://hub.docker.com/r/tanja84dk/yt-dlp
[4]: ./PackageInventory.md
[5]: https://github.com/blackjack4494/yt-dlc
[6]: https://github.com/yt-dlp/yt-dlp/blob/master/LICENSE
[7]: https://github.com/ytdl-org/youtube-dl/blob/master/LICENSE

