FROM python:3.13.0-alpine

RUN pip install --no-cache-dir yamllint

ADD ./ /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

ENTRYPOINT ["yamllint", "--strict", "."]