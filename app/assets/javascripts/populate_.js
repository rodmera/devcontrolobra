$(document).ready(function(){
	var action5 = $('#purchase_Proyecto_edit :selected').text();
	$('#110').val(action5);
		//alert($('#purchase_CentroCosto_edit :selected').text());

	var action6 = $('#purchase_partida_edit :selected').text();
	//alert($('#purchase_partida_edit :selected').text());
	$('#102').val(action6);
		

	$('#alias_select').change( function() {
		var action = $('#alias_select :selected').text();
		$('#supplier_alias').val(action);
		//alert($('#alias_select :selected').text());
		//alert($('#alias_select :selected').val());
	});
	$('#purchase_solicitante').change( function() {
		var action1 = $('#purchase_solicitante :selected').text();
		$('#100').val(action1);
		//alert($('#purchase_solicitante :selected').text());
		//alert($('#alias_select :selected').val());
	});
	$('#purchase_Proyecto').change( function() {
		var action2 = $('#purchase_Proyecto :selected').text();
		$('#101').val(action2);
		//alert($('#101').val());
		//alert($('#alias_select :selected').val());
	});

	$('#purchase_Proyecto_edit').change( function() {
		var action5 = $('#purchase_Proyecto_edit :selected').text();
		$('#110').val(action5);
		//alert($('#purchase_CentroCosto_edit :selected').text());
		//alert($('#alias_select :selected').val());
	});	
	$('#purchase_partida').blur( function() {
		var action3 = $('#purchase_partida :selected').text();
		$('#102').val(action3);
		//alert($('#purchase_partida :selected').text());
		//alert($('#alias_select :selected').val());
	});	


	$('#purchase_partida_edit').change( function() {
		var action8 = $('#purchase_partida_edit :selected').text();
		$('#102').val(action8);
		//alert($('#purchase_partida :selected').text());
		//alert($('#alias_select :selected').val());
	});	

	//CONTROL PARA EL ALIAS DEL PROVEEDOR
	$('#5').change( function() {
		var action4 = $('#5 :selected').text();
		//alert($('#5 :selected').val());
		var id_prov = $('#5 :selected').val();
		$('#103').val(action4);

	    $.ajax({
	    	dataType: 'json',
	        url: '/suppliers/'+ id_prov,
	        type: 'GET',
	        error: function(xhr, status, error) {
	            /* clear old error message, then display the new php error message */
	            //$("#divErrorMessages").empty().append(status);
	            //$("#divErrorMessages").append(xhr.responseText);
	        },
	        success: function(results) { 
	        	var r = $.parseJSON(JSON.stringify(results));
	        	var rut = results.rut
	        	var dir_1 = results.direccion_l1
	        	var fono = results.telefono
	        	var comuna = results.comuna
	        	var razon_social = results.razon_social

	        	//Replace para quitar Comillas
	        	var rut1 = (rut.replace(/["]+/g, ''))
	        	var dir_p = (dir_1.replace(/["]+/g, ''))
	        	var fono_p = (fono.replace(/["]+/g, ''))
	        	var comuna_p = (comuna.replace(/["]+/g, ''))
	        	var razon_social_p = (razon_social.replace(/["]+/g, ''))
	        	//alert(JSON.stringify(results));
	            /* clear the error message first */
	            //Vaciar TextBoxt & Input
	            $("#6").empty();
	            $("#7").empty();
	            $("#8").empty();
	            $("#4").empty(); //comuna
	            $("#66").empty(); //razon_social
	            //$("#divErrorMessages").empty();
	            /* clear old results, then display the new results */
	            //$("#divResults").empty().append(JSON.stringify(rut1));
	            $("#6").val(rut1);
	            $("#7").val(dir_p);
	            $("#8").val(fono_p);
	            $("#4").val(comuna_p);
	            $("#66").val(razon_social_p); //razon_social
	        }
	    });
		//alert($('#purchase_partida :selected').text());
		//alert($('#alias_select :selected').val());
	});

	//CONTROL PARA PARTIDA-PROYECTO
	$('#purchase_Proyecto').change( function() {
		var proyecto = $('#purchase_Proyecto :selected').val();
		$('#110').val(proyecto);
		//$('#purchase_currency').val(ccosto);
		//alert($('#purchase_CentroCosto :selected').val());
		//alert($('#alias_select :selected').val());

				$.ajax({
			    	dataType: 'json',
			        url: '/projects',
			        type: 'GET',
			        data: {ccosto: "001"},
			        error: function(xhr, status, error) {
			            /* clear old error message, then display the new php error message */
			            //$("#divErrorMessages").empty().append(status);
			            //$("#divErrorMessages").append(xhr.responseText);
			        },
			        success: function(data, textstatus, jqXHR) { 
			        	//var r = $.parseJSON(JSON.stringify(results));
			        	//var ccosto = data.ccosto
			        	//Replace para quitar Comillas
			        	//var rut1 = (rut.replace(/["]+/g, ''))
			        	//alert(JSON.stringify(data));
			            /* clear the error message first */

			            //Vaciar TextBoxt & Input
			            //console.log("Dynamic country select OK!")


			            //$("#divErrorMessages").empty();

			            /* clear old results, then display the new results */
			            //$("#divResults").empty().append(JSON.stringify(data));

			        }
			    });//FIN AJAX

	});

	//$("#boton_aprobar").addClass('btn btn-success btn-sm active');
	//alert($("#boton_aprobar").attr('class'));
	//var key = "<%= j(params[:estado]) %>";
	//alert(key);
    //$('a[disabled=disabled]').click(function(event){
    //    event.preventDefault(); // Prevent link from following its href
    //});
});
