@UserView = Backbone.View.extend {
  events: {
    'click' : 'isClicked'
  }
  isClicked: () ->
    console.log(this)
  render: () ->
    console.log(this)
    this.$el.html('Hello')
}

AppView = Backbone.View.extend {
  el: document.getElementById('app')
  events: {
    'click' : 'addUser'
  }
  initialize: () ->

  addUser: (e) ->
    e.preventDefault()
    console.log('clicked')
}
