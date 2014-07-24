Template.newSpace.events
  'submit': (event) ->
    event.preventDefault()
    form = {}
    $.each $("#insertSpaceForm").serializeArray(), () ->
      console.log "name:" + @name + "value:" + @value
      form[@name] = @value

    Spaces.create form

    $("#newSpaceForm").modal("hide")

Template.newSpace.helpers
  building_id: -> Router.current().params._id
