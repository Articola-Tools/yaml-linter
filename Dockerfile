FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# NOTE: For some reason `pipx ensurepath` doesn't work, so we are making yammlint available in PATH manually
RUN apt-get update && apt-get install -y --no-install-recommends pipx && pipx install yamllint \
    && ln -s ~/.local/bin/yamllint /usr/local/bin/yamllint \
    && apt-get purge -y --auto-remove \
    && apt-get clean && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /usr/share/locale /usr/share/zoneinfo

ADD ./ /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

ENTRYPOINT ["yamllint", "--strict", "."]