# CV and Resume Project

This project contains the source code for my CV and Resume, built using Tectonic
in a containerized environment.

## Project Structure

-   `cv/`: Contains the CV LaTeX source and styles (Tectonic V2 project).
-   `resume/`: Contains the Resume LaTeX source and styles (Tectonic V2
    project).
-   `Containerfile`: Defines the container image with Tectonic 0.16.8 and Biber
    2.20.
-   `justfile`: Contains recipes to build the PDFs.

## Development Environment

The development environment is based on Podman (rootless) and an Ubuntu 24.04
container image.

### Prerequisites

-   Podman
-   just

### Building PDFs

You can use `just` to build the PDFs. The `justfile` is configured to
automatically build the container image if it doesn't exist, and run Tectonic
inside the container.

-   To build both CV and Resume: `just`
-   To build only the CV: `just cv`
-   To build only the Resume: `just resume`

The output PDFs will be generated in the root `build/` directory: -
`build/cv.pdf` - `build/resume.pdf`

## GitHub Actions

A GitHub Action workflow is configured to build and publish the PDFs as
artifacts on every push to `main` or `master`.

The latest built PDFs are available as assets in the
[Latest Release](https://github.com/Aetf/cv/releases/tag/latest).
