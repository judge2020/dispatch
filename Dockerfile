FROM ubuntu:18.04

LABEL "name"="Discord Dispatch"
LABEL "maintainer"="Judge2020 <8601934+judge2020@users.noreply.github.com>"
LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/judge2020/dispatch-docker"

LABEL "com.github.actions.name"="Discord Dispatch"
LABEL "com.github.actions.description"="Use Discord's Dispatch CLI for the Discord Games marketplace"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="gray-dark"

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget -O /dispatch https://dl-dispatch.discordapp.net/download/linux \
  && chmod +x /dispatch
ENTRYPOINT ["/dispatch"]
