FROM ubuntu:24.04
RuN apt update
RUN apt install jq wget -y
RUN wget https://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
RUN apt update --allow-insecure-repositories
RUN apt -y --allow-unauthenticated install --reinstall d-apt-keyring
RUN apt update
RUN apt install dmd-compiler dub -y
WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
