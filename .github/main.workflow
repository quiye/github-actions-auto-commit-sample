workflow "git commit" {
  on = "push"
  resolves = ["git command1", "git command2"]
}

action "git command1" {
  uses = "srt32/git-actions@v0.0.3"
  runs = "date [YYYY.]MM.DD-hh:mm[:ss] > hoge"
}

action "git command2" {
  uses = "srt32/git-actions@v0.0.3"
  needs = ["git command1"]
  runs = "pwd && ls -l && git add hoge && git commit -m `date` && git push origin master"
}
