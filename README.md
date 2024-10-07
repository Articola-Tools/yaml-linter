# Articola Tools' YAML linter

This repo contains Dockerfile with preconfigured [YAML linter](https://github.com/adrienverge/yamllint).
This linter is used in Articola Tools organization's repositories to lint YAML files like
GitHub Actions.

## Usage

Use `ghcr.io/articola-tools/yaml-linter` Docker image with `-v ./:/linter_workdir/repo`
parameter, where `./` - is a path to a folder with files you want to lint.

Example command to use this linter -
`docker run --rm -v ./:/linter_workdir/repo ghcr.io/articola-tools/yaml-linter`
