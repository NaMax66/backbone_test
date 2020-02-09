@AppView = Backbone.View.extend
  el: '#app'
  events:
    "keypress #phone-input": 'addNewUser'
    "click #add_new_user-btn": 'addNewUser'
  initialize : ->
    this.$phoneInput = this.$('#phone-input')
    this.$userInput = this.$('#user-input')

    this.listenTo Users, "add", this.addOne

    ###Users.fetch()###

  render: ->
    this.$phoneInput.show()

  newUser: ->
    phone: this.$phoneInput.val().trim()
    user: this.$userInput.val().trim()
    id: Math.floor(Math.random() * 10000)


  addNewUser: (event) ->
    event.preventDefault()
    console.log(event, 'add new user')
    Users.create this.newUser()
    this.$phoneInput.val ""









@UserView = Backbone.View.extend {
  tagName: 'li'
  template: _.template( $("#userTemplate").html() )
  events: {
    'click' : 'isClicked'
  }
  initialize: ->
    ###this.listenTo this.model, "change", this.render
    this.listenTo this.model, "destroy", this.remove###
  render: () ->
    console.log('rendering user')
    console.log(this.model.attributes)
    this.$el.html(this.template(this.model.attributes))
    this
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
