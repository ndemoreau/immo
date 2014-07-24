#@Fsbanks = new FS.Collection("fsBanks",
#  stores: [new FS.Store.FileSystem("fsBanks",
#    path: "~/uploads"
#  )]
#)

s3Store = new FS.Store.S3("fsBanks",
  region: "eu-west-1"
  accessKeyId: ->
    Meteor.call(s3_key)
  secretAccessKey: ->
    Meteor.call(s3_secret)
  bucket: "immondm" #required
)

@FsBanks = new FS.Collection("fsBanks",
  stores: [s3Store]
)

FS.debug = true

FsBanks.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    false
  download: ->
    true
  fetch: []
