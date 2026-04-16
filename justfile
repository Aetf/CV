default: cv resume

cv:
    podman run --rm -v {{justfile_directory()}}/cv:/data -w /data cv-tectonic tectonic -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex/bbx -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex/cbx -Z search-path=lib cv.tex

resume:
    podman run --rm -v {{justfile_directory()}}/resume:/data -w /data cv-tectonic tectonic -Z search-path=lib resume.tex
