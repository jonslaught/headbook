
@Posts = new Meteor.Collection('posts')
@Friends = new Meteor.Collection('friends')

###
@addFriend = (from,to) ->
  Meteor.users.update from,
    $addToSet:
      'profile.friends': to
###


@isFriend = (from, to) ->
  Friends.findOne({from: from, to: to})?

@addFriend = (from, to) ->
  if not isFriend(from, to)
    Friends.insert
      from: from
      to: to

@addFriendSymmetric = (from, to) ->
  addFriend(from, to)
  addFriend(to, from)

@getFriends = (userId) ->
  Friends.find
    from: userId
  .fetch()


if Meteor.isServer

  Meteor.startup ->

    if Meteor.users.find().count() == 0

      homer = Accounts.createUser
        email: 'homer@simpsons.com'
        profile:
          name: 'Homer'
        password: 'doh'
        

      bart = Accounts.createUser
        email: 'bart@simpsons.com'
        profile:
          name: 'Bart'
        password: 'eatmyshorts'
        

      ned = Accounts.createUser
        email: 'ned@flanders.com'
        profile:
          name: 'Ned'
        password: 'okilydokily'
        

      addFriendSymmetric(bart,homer)

