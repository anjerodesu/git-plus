{BufferedProcess} = require 'atom'
StatusView = require './status-view'

# if all param true, then 'git add .'
gitAdd = (all=false)->
  dir = atom.project.getRepo().getWorkingDirectory()
  currentFile = atom.workspace.getActiveEditor().getPath()
  toStage = if all then '.' else currentFile
  new BufferedProcess({
    command: 'git'
    args: ['add', '--all', toStage]
    options:
      cwd: dir
    stderr: (data) ->
      new StatusView(type: 'alert', message: data.toString())
    exit: (data) ->
      file = if toStage is '.' then 'all files' else toStage
      new StatusView(type: 'success', message: "Added #{file}")
  })

module.exports = gitAdd
