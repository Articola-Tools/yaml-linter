FROM python:3.14.3-alpine

RUN addgroup -S lintergroup && adduser -S linteruser -G lintergroup

RUN pip install --no-cache-dir yamllint==1.35.1

COPY ./ /linter_workdir

RUN chown -R linteruser:lintergroup /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

USER linteruser

HEALTHCHECK --timeout=1s --retries=1 CMD yamllint --version || exit 1

ENTRYPOINT ["yamllint", "--strict", "."]