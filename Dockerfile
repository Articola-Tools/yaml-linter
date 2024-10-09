FROM python:3.13.0-alpine

RUN addgroup -S lintergroup && adduser -S linteruser -G lintergroup

RUN pip install --no-cache-dir yamllint

ADD ./ /linter_workdir
RUN chown -R linteruser:lintergroup /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

USER linteruser

ENTRYPOINT ["yamllint", "--strict", "."]