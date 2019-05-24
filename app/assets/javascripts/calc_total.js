$(document).ready(function(){
    var qty=$("#qty");
    
    $("#unit_value").keyup(function(){
    	var unit_value=$("#unit_value");
        var total=isNaN(parseInt(qty.val()* unit_value.val())) ? 0 :(qty.val()* unit_value.val())
        $("#total_neto").val(total);
    });
});