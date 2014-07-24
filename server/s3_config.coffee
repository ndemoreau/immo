#
#@Images = new FS.Collection("images",
#  store: new FS.Store.S3("images",
#    accessKeyId: "AKIAIFFRVBP7NWS2I7KA" #required if environment variables are not set
#    secretAccessKey: "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" #required if environment variables are not set
#    bucket: "immondm" #required
#  )
#)
#
#Images.allow
#  insert: ->
#    true
#  update: ->
#    true
#  remove: ->
#    false
#
#Meteor.publish "images", () ->
#  Images.find()
#
#
#Meteor.methods
#  uploadToS3: (event) ->
#    console.log "uploading..."
#    FS.Utility.eachFile event, (file) ->
#      Images.insert file, (err, fileObj) ->
