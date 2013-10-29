
Template.header.events =
  'click #logout': ->
    Meteor.logout()



doLogin = ->
  callback = (err) ->
    if err?
      $('.alert').fadeIn()
      $('.alert').text(err.message)
    else
      # success
      Meteor.Router.to('/profile')

  Meteor.loginWithPassword $('#inputEmail').val(), $('#inputPassword').val(), callback


Template.login.events =
  'keyup input': (event) ->
    if event.which == 13 #enter key
      doLogin()

  'click button': ->
    doLogin()

    
doRegister = ->
  callback = (err) ->
    console.log err
    if err?
      $('.alert').fadeIn()
      $('.alert').text(err.message)
    else
      Meteor.Router.to('/profile')

  if not $('#inputPassword').val()
    $('.alert').fadeIn()
    $('.alert').text('Please fill in all the fields')
    return


  opt =
    email: $('#inputEmail').val()
    password: $('#inputPassword').val()
    profile:
      name: $('#inputName').val()

  Accounts.createUser opt, callback

Template.register.events =
  'click button': -> doRegister()
  'keyup input': (event) ->
    if event.which == 13 #enter key
      doRegister()

    
