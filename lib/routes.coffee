Router.configure
  layoutTemplate: 'layout'

Router.route('/', {name: 'home'})

Router.route '/editor',
  data: ->
    Codes.find().fetch()[0]
