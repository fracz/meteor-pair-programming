Template.editor.rendered = ->
  editor = CodeMirror.fromTextArea @find("#myTextarea"),
    lineNumbers: true
    mode: "javascript"

  warning = null

  editor.on 'cursorActivity', ->
    warning?.clear()
    warning = editor.addLineWidget editor.getCursor().line, $('<span>hello!</span>')[0],
      above: yes

  editor.on 'blur', ->
    editor.markText {line: 1, ch: 0}, {line: 4, ch: 0},
      className: 'red'
      atomic: yes
      readOnly: yes
    warning?.clear()
