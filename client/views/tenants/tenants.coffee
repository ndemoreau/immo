Template.spaceTenants.events
  'click #newTenantButton': ->
#    UI.insert(UI.render(Template.newTenant),document.body)
    $("#tenantsList").addClass("hidden")
    $("#newTenant").removeClass("hidden")

Template.spaceTenants.helpers

Template.tenantsList.helpers
  tenants: -> Tenants.find({space_id: Router.current().params._id})
  building_id: -> Router.current().params._building_id
  space_id: -> Router.current().params._id
