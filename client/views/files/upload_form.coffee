Template.uploadForm.events "change .myFileInput": (event, template) ->
  console.log("Images defined: " + FsBanks);
  FS.Utility.eachFile event, (file) ->
    FsBanks.insert file, (err, fileObj) ->

