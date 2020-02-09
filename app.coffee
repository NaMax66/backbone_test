el = document.getElementById('user-list')

###
user = new User({name: 'Max', phone: '123'})
userView = new UserView {el, model: user}
userView.render()###

document.addEventListener 'DOMContentLoaded', () ->
  new AppView()
