# appimagetool container images

Automatically built and published container images for [appimagetool](https://github.com/AppImage/appimagetool), a low-level tool to generate an AppImage from an existing AppDir.

## Registries

| Registry | Image |
|---|---|
| GitHub Container Registry | `ghcr.io/its-me/appimagetool` |
| Docker Hub | `1tsme/appimagetool` |
| Quay.io | `quay.io/itsme/appimagetool` |

## Supported architectures

`amd64`, `arm64`, `arm/v7`, `386`

## Usage

```sh
docker run --rm \
  --device /dev/fuse \
  --cap-add SYS_ADMIN \
  -v "$(pwd):/work" \
  -w /work \
  1tsme/appimagetool \
  appimagetool MyApp.AppDir MyApp.AppImage
```

## Tags

| Tag | Description |
|---|---|
| `latest` | Latest stable release |
| `1.9.1`, `1.9.0`, … | Pinned to a specific upstream release |

Releases are tracked automatically from [AppImage/appimagetool](https://github.com/AppImage/appimagetool) and new images are built within 24 hours of an upstream release.

## License

[MIT](LICENSE)
