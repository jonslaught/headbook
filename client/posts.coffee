

Template.directory.users = ->
  Meteor.users.find().fetch()

Template.feed.posts = ->
  friends = Meteor.users.find().fetch() # narrow to your friends
  console.log friends

  posts = Posts.find
    creator: {$in: (f._id for f in friends)}
  ,
    sort:
      time: -1
  .fetch()

  for post in posts
    post.creator = Meteor.users.findOne post.creator
    post



Template.profile.yours = ->
  Meteor.userId() == Session.get 'viewing_user'

Template.profile.user = ->
  user = Meteor.users.findOne Session.get 'viewing_user'

Template.profile.posts = ->
  posts = Posts.find
    creator: Session.get 'viewing_user'
  ,
    sort:
      'time': -1
  .fetch()

  for post in posts
    post.creator = Meteor.users.findOne post.creator
    post


Template.profile.events =
  'click button': ->
    Posts.insert
      time: new Date()
      text: $('textarea').val()
      creator: Session.get 'viewing_user'