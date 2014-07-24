Template.newTenant.events
  'change .datepicker': (event) ->
    $(".datepicker").datepicker('hide')
  'change input.duration': (e) ->
    if ($("[name=entry_date]").val() != null and $("[name=contract_duration]").val() > 0)
      entry_date = new Date($("[name=entry_date]").val())
      exit_date = moment($("[name=entry_date]").val()).add('months', $("[name=contract_duration]").val()).subtract('d', 1).format('YYYY-MM-DD')
      $("[name=exit_date]").val(exit_date)

Template.newTenant.helpers
  space_id: -> Router.current().params._id

Template.newTenant.rendered =  ->
 # console.log this.data.current_tenant.exit_date
#  current: this.data.tenants.find({space_id: this.space._id}).sort("entry_date" => -1).limit(1).first()
  start =  moment(this.data.current_tenant.exit_date).add('d', 1).format('YYYY-MM-DD')
#  start = new Date()
  $('input[type=date]').datepicker
    format: "yyyy-mm-dd"
    startDate: start

