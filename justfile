default: cv resume

build-image:
    podman pull ghcr.io/aetf/cv:latest || true
    podman build --cache-from ghcr.io/aetf/cv -t ghcr.io/aetf/cv:latest {{justfile_directory()}}

cv: build-image
    mkdir -p build/cache
    podman run --rm -v {{justfile_directory()}}:/data -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic -w /data ghcr.io/aetf/cv:latest tectonic -o build cv/cv.tex

resume: build-image
    mkdir -p build/cache
    podman run --rm -v {{justfile_directory()}}:/data -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic -w /data ghcr.io/aetf/cv:latest tectonic -o build resume/resume.tex
