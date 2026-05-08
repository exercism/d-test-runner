FROM ubuntu:24.04@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b
RUN apt update && \
    apt install jq wget -y && \
    wget https://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    apt update --allow-insecure-repositories && \
    apt -y --allow-unauthenticated install --reinstall d-apt-keyring && \
    apt update && \
    apt install dmd-compiler dub -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
