Meteor.Router.add

  '': 'feed'

  '/login': 'login'
  '/register': 'register'


  '/profile': ->
    if Meteor.user()?
      Session.set 'viewing_user', Meteor.userId()
      return 'profile'
    else
      return 'login'

  '/profile/:id': (id) ->
    Session.set 'viewing_user', id
    'profile'
  


  '/feed': 'feed'
  '/directory': 'directory'