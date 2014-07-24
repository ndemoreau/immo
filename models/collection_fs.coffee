#@Images = new FS.Collection("images",
#  stores: [new FS.Store.FileSystem("images",
#    path: "~/uploads"
#  )]
#)

s3Store = new FS.Store.S3("images",
  region: "eu-west-1"
  accessKeyId: ->
    Meteor.call(s3_key)
  secretAccessKey: ->
    Meteor.call(s3_secret)
  bucket: "immondm" #required
)

@Images = new FS.Collection("images",
  stores: [s3Store]
)

FS.debug = true

Images.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    false
  download: ->
    true
  fetch: []
