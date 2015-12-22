Template.editor.rendered = ->

#  console.log @data

  editor = CodeMirror.fromTextArea @find("#myTextarea"),
    lineNumbers: true
    mode: "javascript"

  warning = null

  editor.on 'cursorActivity', ->
    warning?.clear()
    warning = editor.addLineWidget editor.getCursor().line, $('<span>hello!</span>')[0],
      above: yes

  editor.on 'blur', ->
#    editor.markText {line: 1, ch: 0}, {line: 4, ch: 0},
#      className: 'red'
#      atomic: yes
#      readOnly: yes
#    warning?.clear()

  editor.on 'changes', =>
    code = editor.getValue()
    Codes.update({_id: @data._id}, {$set: {code: code}})

  Tracker.autorun =>
    code = Codes.find(_id: @data._id).fetch()[0].code
    if code isnt editor.getValue()
      editor.setValue(code)
