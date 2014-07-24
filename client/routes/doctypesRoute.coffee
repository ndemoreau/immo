Router.map ->
  @route "doctypes",
    path: "/doctypes"
    waitOn: ->
      [subs.subscribe "allDoctypes",
        subs.subscribe "allFsBanks"]

    data: ->
      doctypes: Doctypes.find()
      fsBanks: FsBanks.find()
      fsBanksCollection: FsBanks

  @route "doctype",
    path: "/doctypes/:_id"
    waitOn: ->
      subs.subscribe "allDoctypes"

    data: ->
      doctype: Doctypes.findOne(@params._id)
      doctypes: Doctypes.find()

  @route "doctypeNew",
    path: "/doctype/new"
    template: "doctypeForm"
    waitOn: ->
      subs.subscribe "allDoctypes"

    data: ->
      doctypes: Doctypes.find()
      formType: "insert"

  @route "doctypeEdit",
    path: "/doctype/:_id/edit"
    template: "doctypeForm"
    waitOn: ->
      [subs.subscribe "allDoctypes",
        subs.subscribe "allTenants"]

    data: ->
      doctypes: Doctypes.find()
      doctype: Doctypes.findOne(@params._id)
      formType: "update"
      tenant: Tenants.findOne()
