Template.building.rendered = ->


Template.building.events
  "click .delete": (e, instance) ->
    building = this
    e.preventDefault()
    Meteor.call "removeBuilding", building, (error, result) ->
      alert "building deleted."
      Router.go "/buildings"



Template.space.helpers
  created_on: ->
    day = new Date(this.creation_date)
    moment(day).fromNow()
  allowedValues: -> return {'Furnished': 'Furnished', 'Not Furnished': 'Not Furnished'}




