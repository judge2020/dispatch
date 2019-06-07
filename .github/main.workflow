workflow "Build" {
  on = "push"
  resolves = ["build"]
}

action "download-dispatch" {
  uses = "docker://alpine"
  args = "sh .github/download.sh"
}

action "build" {
  uses = "actions/docker/cli@master"
  needs = ["download-dispatch"]
  args = "build -t judge2020/dispatch ."
}
