default: cv resume

build-image:
    podman pull ghcr.io/aetf/cv:latest || true
    podman pull ghcr.io/aetf/cv/cache:latest || true
    podman build --layers --cache-from ghcr.io/aetf/cv/cache --cache-to ghcr.io/aetf/cv/cache -t ghcr.io/aetf/cv:latest {{justfile_directory()}}

cv: build-image
    mkdir -p build
    podman run --rm -v {{justfile_directory()}}/cv:/data -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic -w /data ghcr.io/aetf/cv:latest tectonic -X build
    cp cv/build/cv/cv.pdf build/cv.pdf

resume: build-image
    mkdir -p build
    podman run --rm -v {{justfile_directory()}}/resume:/data -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic -w /data ghcr.io/aetf/cv:latest tectonic -X build
    cp resume/build/resume/resume.pdf build/resume.pdf
