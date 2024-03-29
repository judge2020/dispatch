workflow "Build" {
  on = "push"
  resolves = ["docker-push latest"]
}

action "download-dispatch" {
  uses = "docker://alpine"
  args = "sh .github/download.sh"
}

action "docker-build" {
  uses = "actions/docker/cli@master"
  needs = ["download-dispatch"]
  args = "build -t judge2020/dispatch:latest ."
}

action "filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  needs = ["docker-build"]
}

action "docker-login" {
  uses = "actions/docker/login@master"
  needs = ["filter"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "docker-push latest" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "push judge2020/dispatch:latest"
  needs = ["docker-login"]
}
