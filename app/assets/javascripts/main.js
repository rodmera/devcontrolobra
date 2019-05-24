$(document).ready(function(){
	$(window).load(function() {
            setTimeout(function() {
            $('.alert-notice').fadeOut('fast');
            }, 5000); // <-- time in milliseconds
            //setTimeout(function() {
            //$('.alert-alert').fadeOut('fast');
            //}, 3000); // <-- time in milliseconds
	$('input').click(function(){
		$(this).select();
	});


  $(document).on('keypress', '#project_name', function(e){
     return !(e.keyCode == 32);
  });


	$('.datepicker').datepicker({
		dateFormat: 'dd/mm/yy'
	});

	$('.input-daterange').datepicker({
		dateFormat: 'dd/mm/yy'
	});

	$('#purchase_date').datepicker({
		dateFormat: 'DD-MM-YY'
	});

	$('#purchase_date').change(function(){
		var date = $('#purchase_date').val();
		$('.purchase_header_date').empty();
		$('.purchase_header_date').append(date);
	});

	$('#9').blur(update_balance);
	$('#cost').blur(update_balance);
	$('#agrega_fila').click(function(){
		//alert( "Handler for .click() called." );
		//if ($('#checkbox_eliminar').length > 6) $('#agrega_fila').hide();
		var rowCount = 0;
		var rowCount = document.getElementById('items').rows.length;
     	for (i = 0; i < rowCount; i++) {
     		     	if (document.getElementById('items').rows.length >= 60)
     	{
     		$('#agrega_fila').hide();
     	}
        //alert(i);
     	}

		bind1();
	});

	$('#items').change(function() {
		bind1();
		//alert( "Handler for .click() called." );
	});

	bind1();	

	$('body').on('click', '.delete_td', function(){
		$(this).parents('.item-row').remove();
		update_subtotal();
		calculo3();
		//if ($('.checkbox_eliminar').length > 6) $('#agrega_fila').hide();
	});

//$('input:checkbox').change(function () {
//		alert($(this).closest("input[type=hidden]").val());
//		//$(this).prev('input[type=hidden]').val("true");
//    	$(this).parents("input[type=hidden]").val('1');
//    	$(this).parents('.item-row').hide();
//});
 
  $('body').on('click', '#checkbox_eliminar', function(){
    if($(this).is(':checked')) {
      //alert('checked!');
    } else {
      //alert('not checked!');
      $(this).parents('.item-row').hide();
      	update_subtotal();
		calculo3();
    }
  });

$('body').on('blur', '#rut', function(){
    if (Fn.validaRut( $('#rut').val() )){
    	alert('El RUT ingresado es Válido');

    } else {
    	alert('El RUT No es Válido. Intente Nuevamente');
        $('#rut').val('');
       
    }
});

	$('body').on('keyup', '#purchase_currency', function(){
		var c = $(this).val();
		$('.subtotal_currency').empty();
		$('.subtotal_currency').append(" " + c);
	});

	$('body').on('click', '#submit_purchase', function(){
		var e = $('#purchase_total').val();
		$('#purchase_total1').empty();
		$('#purchase_total1').val(e);
	});

	$('body').on('click', '#submit_purchase', function(){
		var n = $('#9').val();
		//alert($('#price1').html());
		$('#monto_impuesto').empty();
		$('#monto_impuesto').val(n);
	});	

	$('body').on('click', '#submit_purchase', function(){
		var f = $('#subtotal').val();
		$('#subtotal1').empty();
		$('#subtotal1').val(f);
	});	

	$('body').on('click', '#purchase_button', function(){

		//alert($('#subtotal_edit').html());
		//var x = $('#subtotal_edit').html();
		//alert($('#subtotal_edit').val(Number(x)));		
		//var e = $('#purchase_total').val();
		//alert(e);
		//$('#purchase_total1').empty();
		//$('#purchase_total1').val(Number(e));
		
		for (var i =1; i < 250; i++){
			var id = i.toString();
			bind($('#' + id), $("#modal_" + id));
		}
		
		bind($('#subtotal'), $("#modal_subtotal"));
		//bind2($('#subtotal'), $("#modal_subtotal"));
		bind($('#purchase_total'), $("#modal_purchase_total"));
		//bind2($('#subtotal_edit'), $("#modal_subtotal_edit"));
		bind2($('#purchase_number'), $("#modal_purchase_number"));
		//alert($("#modal_purchase_total").val());
		//bind2($('#purchase_total'), $("#modal_purchase_total"));
		bind($('#' + id), $("#modal_" + id));
		bind($('#purchase_date'), $("#modal_purchase_date"));
		bind($('#purchase_solicitante'), $("#modal_purchase_solicitante"));
		
		//alert($("#101").val());
		bind($('#101'), $("#modal_purchase_Proyecto"));


		

		var rows = $('.item-row:visible');
		$("#modal_tbody").empty();

		for (i = 0; i < rows.length; i++){
			var row = rows[i];
			var name = $(row).find(".item_name").val();
			$('#modal_tbody').append('<tr class="modal-item-row"></tr>');
			$('.modal-item-row:last').append('<td>' + name + '</td>');

			var desc = $(row).find(".item_desc").val();
			$('.modal-item-row:last').append('<td>' + desc + '</td>');

			var qty = $(row).find(".qty").val();
			$('.modal-item-row:last').append('<td>' + qty + '</td>');

			var cost = $(row).find(".cost").val();
			$('.modal-item-row:last').append('<td>' + cost + '</td>');

			var dscto = $(row).find(".dscto").val();
			$('.modal-item-row:last').append('<td>' + dscto + '</td>');			

			var price = $(row).find(".price").val();
			var curr = $('#purchase_currency').val();
			$('.modal-item-row:last').append('<td>' + ' ' + '<span>' + curr + '</span>' + price + '</td>');
		}

	});

$('body').on('click', '#purchase_button_edit', function(){
		//alert($('#subtotal_edit').html());
		//var x = $('#subtotal_edit').html();
		//alert($('#subtotal_edit').val(Number(x)));		

		//var e = $('#purchase_total').val();
		//alert(e);
		//$('#purchase_total1').empty();
		//$('#purchase_total1').val(Number(e));

		for (var i =1; i < 250; i++){
			var id = i.toString();
			bind($('#' + id), $("#modal_" + id));
		}
		
		bind($('#subtotal'), $("#modal_subtotal"));
		//bind2($('#subtotal'), $("#modal_subtotal"));
		bind($('#purchase_total'), $("#modal_purchase_total"));
		//bind2($('#subtotal_edit'), $("#modal_subtotal_edit"));
		bind2($('#purchase_number'), $("#modal_purchase_number"));
		//alert($("#modal_purchase_total").val());
		//bind2($('#purchase_total'), $("#modal_purchase_total"));
		bind($('#' + id), $("#modal_" + id));
		bind($('#purchase_date'), $("#modal_purchase_date"));
		bind($('#purchase_solicitante'), $("#modal_purchase_solicitante"));
		
		bind($('#110'), $("#modal_purchase_Proyecto_edit"));
		//alert($("#102").val());
		bind($('#102'), $("#modal_102"));
		//alert($("#purchase_partida").val());
		var rows = $('.item-row:visible');
		$("#modal_tbody").empty();

		for (i = 0; i < rows.length; i++){
			var row = rows[i];
			var name = $(row).find(".item_name").val();
			$('#modal_tbody').append('<tr class="modal-item-row"></tr>');
			$('.modal-item-row:last').append('<td>' + name + '</td>');

			var desc = $(row).find(".item_desc").val();
			$('.modal-item-row:last').append('<td>' + desc + '</td>');

			var qty = $(row).find(".qty").val();
			$('.modal-item-row:last').append('<td>' + qty + '</td>');

			var cost = $(row).find(".cost").val();
			$('.modal-item-row:last').append('<td>' + cost + '</td>');

			var dscto = $(row).find(".dscto").val();
			$('.modal-item-row:last').append('<td>' + dscto + '</td>');			

			var price = $(row).find(".price").val();
			var curr = $('#purchase_currency').val();
			$('.modal-item-row:last').append('<td>' + ' ' + '<span>' + curr + '</span>' + price + '</td>');
		}

	});
	});
});