Meteor.Router.add

  '': ->
    if Meteor.user()
      'feed'
    else
      'login'

  '/login': 'login'
  '/register': 'register'

  '/profile': ->
    Session.set 'viewing_user', Meteor.userId()
    'profile'

  '/profile/:id': (id) ->
    Session.set 'viewing_user', id
    'profile'
  


  '/feed': 'feed'
  '/directory': 'directory'