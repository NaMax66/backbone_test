User = Backbone.Model.extend {
  defaults: ->
    name: 'Max'
    phone: '123'
  initialize: () ->
    if !this.get('name') and !this.get('phone')
      this.set 'name' : this.defaults.name
      this.set 'phone' : this.defaults.phone
  clear: () ->
    this.destroy()
}

UserView = Backbone.View.extend {
  events: {
    'click' : 'isClicked'
  }
  isClicked: () ->
    console.log(this)
  render: () ->
    console.log(this)
    this.$el.html('Hello')
}

el = document.getElementById('app')

user = new UserView {el: el}
user.render()

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

