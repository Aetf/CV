default: cv resume

build-image:
    podman pull ghcr.io/aetf/cv:latest || true
    podman pull ghcr.io/aetf/cv/cache:latest || true
    if [ "${CI:-}" = "true" ]; then \
        podman build --layers --cache-from ghcr.io/aetf/cv/cache --cache-to ghcr.io/aetf/cv/cache -t ghcr.io/aetf/cv:latest {{justfile_directory()}}; \
    else \
        podman build --layers --cache-from ghcr.io/aetf/cv/cache -t ghcr.io/aetf/cv:latest {{justfile_directory()}}; \
    fi

cv: build-image
    mkdir -p build/cache
    podman run --rm \
        -v {{justfile_directory()}}/cv:/data:O \
        -v {{justfile_directory()}}/build:/data/build \
        -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic \
        ghcr.io/aetf/cv:latest \
        tectonic -X build
    mv build/cv/cv.pdf build/cv.pdf

resume: build-image
    mkdir -p build/cache
    podman run --rm \
        -v {{justfile_directory()}}/resume:/data:O \
        -v {{justfile_directory()}}/build:/data/build \
        -v {{justfile_directory()}}/build/cache:/root/.cache/Tectonic \
        ghcr.io/aetf/cv:latest \
        tectonic -X build
    mv build/resume/resume.pdf build/resume.pdf
