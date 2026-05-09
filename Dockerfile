FROM ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64
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
