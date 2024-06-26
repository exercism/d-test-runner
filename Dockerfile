FROM ubuntu:24.04
RUN apt update && \
    apt install jq wget -y && \
    wget https://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    apt update --allow-insecure-repositories && \
    apt -y --allow-unauthenticated install --reinstall d-apt-keyring && \
    apt update && \
    apt install dmd-compiler dub -y
WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
