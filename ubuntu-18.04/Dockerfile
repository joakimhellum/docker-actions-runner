FROM ubuntu:18.04

RUN groupadd -r runner && useradd -r -g runner runner

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git jq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /actions-runner

ENV RUNNER_VERSION 2.160.0

RUN curl -O https://githubassets.azureedge.net/runners/${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar -zxf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && rm -f actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && ./bin/installdependencies.sh \
    && chown -R runner:runner /actions-runner

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

USER runner
