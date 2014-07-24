# ---------------------------------------------------- +/
#
# ## Tenants ##
#
# All code related to the Tenants collection goes here. 
#
# /+ ---------------------------------------------------- 
@Tenants = new Meteor.Collection("tenants",
  schema:
    space_id:
      type: String
      label: "Space"
      max: 50

    firstname:
      type: String
      label: "First Name"
      optional: true
      max: 50

    lastname:
      type: String
      label: "Last Name"
      optional: true
      max: 50

    address:
      type: String
      label: "Address"
      max: 50

    address2:
      type: String
      label: "Address 2"
      max: 50
      optional: true

    email:
      type: String
      label: "E-mail"
      regEx: SimpleSchema.RegEx.Email
      optional: false
      max: 50

    phone:
      type: String
      label: "Phone"
      optional: true
      max: 50

    zip:
      type: String
      label: "Zip code"
      optional: true
      regEx: /^[0-9]{4,5}$/
      max: 50

    city:
      type: String
      label: "City"
      optional: true
      max: 50

    country:
      type: String
      label: "Country"
      optional: true
      max: 50

    entry_date:
      type: Date
      label: "Entry date"
      optional: true
      max: 50

    exit_date:
      type: Date
      label: "Exit date"
      optional: true
      max: 50
#      autoValue: () ->
#        this.field("entry_date")

    rent:
      type: Number
      label: "Rent by month"
      optional: true

    costs:
      type: Number
      label: "Costs by month"
      optional: true

    contract_type:
      type: String
      label: "Type of contract"
      allowedValues: ["Not furnished", "Furnished"]
      optional: true
      max: 50

    contract_duration:
      type: Number
      label: "contract duration in months"
      optional: true

    creation_date:
      type: Date
      label: "Creation date"
      defaultValue: new Date()
)

#Tenants.simpleSchema().messages({
#    "regEx zip": "Your Zip Code can only be numeric and should have 5 characters!",
#});

# Allow/Deny
Tenants.allow
  insert: (tenantId, doc) ->
    can.createTenant tenantId

  update: (tenantId, doc, fieldNames, modifier) ->
    can.editTenant tenantId, doc

  remove: (userId, doc) ->
    !!userId

Tenants.helpers
  fullname: ->
    participant = Participants.findOne(@participant_id)
    participant.firstname + " " + participant.lastname

  subscription_date: ->
    moment(Date(@creation_date)).format "DD MMMM"


# Methods
Meteor.methods
  createTenant: (tenant) ->

    #    if(can.createTenant(Meteor.tenant()))
    id = Tenants.insert(tenant)
    id

  removeTenant: (tenant) ->

    #    if(can.removeTenant(Meteor.tenant(), tenant)){
    #      console.log("removing tenant" + tenant._id);
    Tenants.remove tenant._id
    return


#    }else{
#      throw new Meteor.Error(403, 'You do not have the rights to delete this tenant.')
#    }