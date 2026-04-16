# CV and Resume Project

This project contains the source code for my CV and Resume, built using Tectonic
in a containerized environment.

## Project Structure

-   `cv/`: Contains the CV LaTeX source and styles.
-   `resume/`: Contains the Resume LaTeX source and styles.
-   `Containerfile`: Defines the container image with Tectonic and Biber.
-   `justfile`: Contains recipes to build the PDFs.

## Development Environment

The development environment is based on Podman (rootless) and Alpine Linux.

### Prerequisites

-   Podman
-   just

### Building the Container Image

Before building the PDFs, you need to build the container image:

```bash
podman build -t cv-tectonic .
```

### Building PDFs

You can use `just` to build the PDFs. The `justfile` is configured to run
Tectonic inside the container.

-   To build both CV and Resume: `bash just`
-   To build only the CV: `bash just cv`
-   To build only the Resume: `bash just resume`

The output PDFs will be generated in their respective directories: -
`cv/cv.pdf` - `resume/resume.pdf`

## GitHub Actions

A GitHub Action workflow is configured to build and publish the PDFs as
artifacts on every push to `main` or `master`.

The latest built PDFs are available as assets in the
[Latest Release](https://github.com/Aetf/cv/releases/tag/latest).
