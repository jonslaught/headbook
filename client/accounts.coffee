

Template.header.events =
  'click #logout': ->
    Meteor.logout()

Template.login.events =
  'click button': ->

    callback = (err) ->
      console.log err
      if err?
        $('.alert').fadeIn()
        $('.alert').text(err.message)
      else
        # success
        Meteor.Router.to('/profile')


    Meteor.loginWithPassword $('#inputEmail').val(), $('#inputPassword').val(), callback



Template.register.events =
  'click button': ->

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