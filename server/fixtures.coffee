if Codes.find().count() is 0
  Codes.insert
    code: """
Template.EditorPage.helpers({

    "editorOptions": function() {
        return {
            lineNumbers: true,
            mode: "javascript"
        }
    },

    "editorCode": function() {
        return "Code to show in editor";
    }

});"""
