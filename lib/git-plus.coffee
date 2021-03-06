GitCommit = require './git-commit'
GitAdd = require './git-add'
GitBranch = require './git-branch'
GitPull = require './git-pull'
GitPush = require './git-push'

module.exports =
  activate: (state) ->
    atom.workspaceView.command "git-plus:commit", -> GitCommit()
    atom.workspaceView.command "git-plus:add", -> GitAdd()
    atom.workspaceView.command "git-plus:add-all", -> GitAdd(true)
    atom.workspaceView.command "git-plus:checkout", -> GitBranch.gitBranches()
    atom.workspaceView.command "git-plus:new-branch", -> GitBranch.newBranch()
    atom.workspaceView.command "git-plus:pull", -> GitPull()
    atom.workspaceView.command "git-plus:push", -> GitPush()

  deactivate: ->

  serialize: ->
