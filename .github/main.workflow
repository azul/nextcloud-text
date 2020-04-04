workflow "Build, Test, and Publish" {
  resolves = ["Publish"]
  on = "release"
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Build" {
  needs = "Install"
  uses = "actions/npm@master"
  args = "run build"
}

action "Publish" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "publish --access public"
  secrets = ["NPM_AUTH_TOKEN"]
}
