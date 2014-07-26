@Transactions = new Meteor.Collection("transactions",
  schema:
    account_number:
      type: String
      label: "IBAN Account"
      max: 50

    entry_nbr:
      type: Number
      label: "Entry Nbr"

    value_date:
      type: Date
      label: "Value date"

    amount:
      type: Number
      label: "Amount"

    description:
      type: String
      label: "Description"
      optional: true
      max: 250

    matching_id:
      type: String
      label: "matching_id"
      optional: true


    creation_date:
      type: Date
      label: "Creation date"
      defaultValue: new Date()

)

# Allow/Deny

#Transactions.allow({
#  insert: function(transactionId, doc){
#    return can.createTransaction(transactionId);
#  },
#  update:  function(transactionId, doc, fieldNames, modifier){
#    return can.editTransaction(transactionId, doc);
#  },
#  remove:  function(transactionId, doc){
#    return can.removeTransaction(transactionId, doc);
#  }
#});

# Methods
Meteor.methods
  createTransaction: (transaction) ->

    #    if(can.createTransaction(Meteor.transaction()))
    p = transaction
    p["creation_date"] = new Date()
    id = Transactions.insert(p)
    return id

  removeTransaction: (transaction) ->

    #    if(can.removeTransaction(Meteor.transaction(), transaction)){
    #      console.log("removing transaction" + transaction._id);
    Transactions.remove transaction._id
    return


#    }else{
#      throw new Meteor.Error(403, 'You do not have the rights to delete this transaction.')
#    }