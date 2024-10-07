FROM python:3.12.7-alpine

# NOTE: For some reason `pipx ensurepath` doesn't work, so we are making yammlint available in PATH manually
RUN pip install --no-cache pipx && pipx install yamllint \
    && ln -s ~/.local/bin/yamllint /usr/local/bin/yamllint \

ADD ./ /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

ENTRYPOINT ["yamllint", "--strict", "."]