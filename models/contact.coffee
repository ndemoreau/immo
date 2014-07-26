# ---------------------------------------------------- +/
#
# ## Contacts ##
#
# All code related to the Contacts collection goes here.
#
# /+ ----------------------------------------------------
@Contacts = new Meteor.Collection("contacts",
  schema:
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

    birthday:
      type: Date
      label: "Entry date"
      optional: true

    is_tenant:
      type: Boolean
      label: "Tenant"
      optional: true

    creation_date:
      type: Date
      label: "Creation date"
      defaultValue: new Date()
)

#Contacts.simpleSchema().messages({
#    "regEx zip": "Your Zip Code can only be numeric and should have 5 characters!",
#});

# Allow/Deny
Contacts.allow
  insert: (contactId, doc) ->
    can.createContact contactId

  update: (contactId, doc, fieldNames, modifier) ->
    can.editContact contactId, doc

  remove: (userId, doc) ->
    !!userId

Contacts.helpers
  fullname: ->
    participant = Participants.findOne(@participant_id)
    participant.firstname + " " + participant.lastname

  subscription_date: ->
    moment(Date(@creation_date)).format "DD MMMM"


# Methods
Meteor.methods
  createContact: (contact) ->

    #    if(can.createContact(Meteor.contact()))
    id = Contacts.insert(contact)
    id

  removeContact: (contact) ->

    #    if(can.removeContact(Meteor.contact(), contact)){
    #      console.log("removing contact" + contact._id);
    Contacts.remove contact._id
    return


#    }else{
#      throw new Meteor.Error(403, 'You do not have the rights to delete this contact.')
#    }