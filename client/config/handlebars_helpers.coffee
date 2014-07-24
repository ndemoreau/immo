Handlebars.registerHelper "participantsCounter", ->
    Participants.find().count()

Handlebars.registerHelper "winnersCounter", ->
    Winners.find().count()

Handlebars.registerHelper "isActive", (template) ->
  currentRoute = Router.current().route.name
  if currentRoute and template is currentRoute then "active"
  else ""

Handlebars.registerHelper "fromNow", (date) ->
  moment(date).fromNow()

Handlebars.registerHelper "date", (date) ->
  moment(date).format("DD/MM/YYYY")

Handlebars.registerHelper "twitIcon", (icon, icon_text) ->
  the_html = "<i class='ace-icon " + icon + "'></i>"
  if icon_text
    the_html = "<span> #{the_html} #{icon_text}</span>"
  return new Handlebars.SafeString the_html

Handlebars.registerHelper "xtitle", (field) ->
  "Enter the " + Tenants.simpleSchema().label(field)

