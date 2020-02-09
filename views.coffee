@AppView = Backbone.View.extend
  el: '#app'
  events:
    "keypress #phone-input": 'handleEvent'
    "click #add_new_user-btn": 'handleEvent'
  initialize : ->
    this.$phoneInput = this.$('#phone-input')
    this.$userInput = this.$('#user-input')

    this.listenTo Users, "add", this.addUserToList

    ###Users.fetch()###

  render: ->
    this.$phoneInput.show()

  newUser: ->
    phone: this.$phoneInput.val().trim()
    user: this.$userInput.val().trim()
    id: Math.floor(Math.random() * 10000)


  handleEvent: () ->
    if event.target.id == 'add_new_user-btn'
      this.addNewUser()
      event.preventDefault()
    if event.key == 'Enter'
      this.addNewUser()
      return

  addNewUser: (event) ->
    Users.create this.newUser()
    this.$userInput.val ""
    this.$phoneInput.val ""

  addUserToList: (user) ->
    console.log('addToList')
    view = new UserView({
      model: user
    });
    return this.$("#user-list").append(view.render().el);



@UserView = Backbone.View.extend {
  tagName: 'li'
  template: _.template( $("#userTemplate").html() )
  events: {
    'click' : 'isClicked'
  }
  initialize: ->
    this.listenTo this.model, "change", this.render
    this.listenTo this.model, "destroy", this.remove
  render: () ->
    console.log('rendering user')
    console.log(this.model.attributes)
    this.$el.html(this.template(this.model.attributes))
    this
}
