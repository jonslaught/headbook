
@Posts = new Meteor.Collection('posts')



Meteor.startup ->


  if Meteor.users.find().count() == 0

    Accounts.createUser
      email: 'homer@simpsons.com'
      profile:
        name: 'Homer'
      password: 'doh'

    Accounts.createUser
      email: 'bart@simpsons.com'
      profile:
        name: 'Bart'
      password: 'eatmyshorts'

    Accounts.createUser
      email: 'ned@flanders.com'
      profile:
        name: 'Ned'
      password: 'okilydokily'
