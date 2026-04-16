default: cv resume

build-image:
    podman build -t cv-tectonic {{justfile_directory()}}

cv: build-image
    mkdir -p build
    podman run --rm -v {{justfile_directory()}}:/data -w /data cv-tectonic tectonic -o build cv/cv.tex

resume: build-image
    mkdir -p build
    podman run --rm -v {{justfile_directory()}}:/data -w /data cv-tectonic tectonic -o build resume/resume.tex
