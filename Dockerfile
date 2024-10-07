LABEL org.opencontainers.image.description="This image contains preconfigured \
[YAML linter](https://github.com/adrienverge/yamllint). \
This linter is used in Articola Tools organization's repositories to lint YAML files like GitHub Actions."

FROM python:3.12.7-alpine

RUN pip install --no-cache-dir yamllint

ADD ./ /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

ENTRYPOINT ["yamllint", "--strict", "."]