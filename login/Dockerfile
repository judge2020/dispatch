FROM alpine

LABEL "name"="Discord Dispatch Login"
LABEL "maintainer"="Judge2020 <8601934+judge2020@users.noreply.github.com>"
LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/judge2020/dispatch-docker"

LABEL "com.github.actions.name"="Discord Dispatch Login"
LABEL "com.github.actions.description"="Set up credentials to log-in to Dispatch"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="gray-dark"

COPY login.sh /
ENTRYPOINT sh /login.sh
