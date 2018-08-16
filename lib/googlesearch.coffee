Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'teomasearch:teoma-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "http://www.teoma.com/web?q=#{cased}"
        Shell.openExternal url
