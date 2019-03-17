$(function(){
	$("#showOrhide").click(function() {
		if($('#leftNav').is(':hidden')){
			$('#leftNav').show();
			restore();
		}else{
			$('#leftNav').hide();
			enlarge();
		}
	});
	function enlarge(){
		$('#page-wrapper').addClass('enlargeShow');
		$("#showOrhide").addClass("J_tabLeft");
	}
	function restore(){
		$('#page-wrapper').removeClass('enlargeShow');
		$("#showOrhide").removeClass("J_tabLeft");
	}
});
