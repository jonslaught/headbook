


Template.profile.user = ->
  user = Meteor.users.findOne Session.get 'viewing_user'

Template.profile.posts = ->
  posts = Posts.find
    creator: Session.get 'viewing_user'
  ,
    sort:
      'time': -1

  posts.fetch()


Template.profile.events =
  'click button': ->
    Posts.insert
      time: new Date()
      text: $('textarea').val()
      creator: Session.get 'viewing_user'