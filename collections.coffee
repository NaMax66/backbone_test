UsersList = Backbone.Collection.extend
  model: User
  url: '/api/users'

@Users = new UsersList()
