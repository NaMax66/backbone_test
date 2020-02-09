@User = Backbone.Model.extend
  defaults:
    user: 'def'
    phone: 'def'
  initialize: () ->
    if !this.get('name') and !this.get('phone')
      this.set 'name' : this.defaults.name
      this.set 'phone' : this.defaults.phone
###  clear: () ->
    this.destroy()###
