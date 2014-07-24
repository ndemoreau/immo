Router.configure
  layoutTemplate: "basicLayout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  mainYieldTemplates:
    footer:
      to: "footer"

    header:
      to: "header"

Router.onBeforeAction "loading"
Router.onBeforeAction ->
  $(".notification").remove()
  return

Router.onAfterAction ->
  setTimeout( ->
    $(".editable").editable
      placement: "right"
      display: ->
      success: (response, newValue) ->
        newVal = {}
        oldVal = $.trim $(this).data("value")
        name = $(this).data("name")
        newVal[name] = newValue
        eval($(this).data("context")).update $(this).data("pk"), $set: newVal
        , (error) ->
          if error
            Notifications.error error.message
          Meteor.defer -> $(".editable[data-name=" + name + "]").data('editableContainer').formOptions.value = oldVal
  ,500)


@subs = new SubsManager()

@getSubTemplate = (template,route) ->
  if route.ready()
    route.render()
    templateName = template
    route.render templateName, to: 'subTemplate'
  else
    route.render 'loading'
