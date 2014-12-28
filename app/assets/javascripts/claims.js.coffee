
ready = ->

	#Initialize datatable
	$("#claims-index").dataTable()

	#New claimant toggle
	$(".new-claimant-form").hide()
	$("[name='accept']").bootstrapSwitch('onText', 'New')
	$("[name='accept']").bootstrapSwitch('offText', 'Existing')
	$("[name='accept']").bootstrapSwitch('onSwitchChange', (event, state) ->
		$(".new-claimant-form").toggle("fast")
		$(".existing-claimant-form").toggle("fast")
	)

	$(".modal-content form, .edit_claim").submit (event) ->
		if $(".new-claimant-form").is(":visible")
			$("#claim_claimant_id").val("")
		else
			$(".new-claimant-form").children().find("input, textarea, select").each ->
				$(this).val("")

	
	$("#claim_litigated").bootstrapSwitch('onText', 'Yes')
	$("#claim_litigated").bootstrapSwitch('offText', 'No')
	$("#legal-fields").hide() if $("#claim_litigated").parent().parent().hasClass("bootstrap-switch-off")
	$("#claim_litigated").bootstrapSwitch('onSwitchChange', (event, state) ->
		$("#legal-fields").toggle("fast")
	)		

	



$(document).ready(ready)
$(document).on('page:load', ready)
