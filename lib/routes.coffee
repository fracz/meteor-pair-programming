Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.route('/', {name: 'home'})

Router.map ->
  @route 'editor',
    data: ->
      Codes.find().fetch()[0]
    action: ->
      @render() if @ready()
