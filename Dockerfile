FROM ubuntu:26.04@sha256:f144425ff09be612d6d9ad965196e9cdc23dae1f42110a8a11a3e9a8198759f7
RUN apt-get update && \
    apt-get install ca-certificates jq wget --yes --no-install-recommends && \
    wget https://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    apt-get update --allow-insecure-repositories && \
    apt-get --yes --no-install-recommends --allow-unauthenticated install --reinstall d-apt-keyring && \
    apt-get update && \
    apt-get install dmd-compiler dub --yes --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
