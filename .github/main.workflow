workflow "git commit" {
  on = "push"
  resolves = ["git command1", "git command2"]
}

action "git command1" {
  uses = "srt32/git-actions@v0.0.3"
  runs = "echo `git log` > hoge"
}

action "git command2" {
  uses = "srt32/git-actions@v0.0.3"
  needs = ["git command1"]
  args = "pwd && ls -l && git add hoge && git commit -m hhhh && git push origin master"
}
