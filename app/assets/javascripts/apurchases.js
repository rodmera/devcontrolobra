function update_subtotal() {
	var subtotal = 0;
	$('.price:visible').each(function(i){
		var price = $(this).val();
		if (!isNaN(price)) subtotal += Number(price);
	});
	//subtotal = subtotal.toFixed(0);
	//$('#subtotal').html(subtotal);
	$('#subtotal').val(subtotal);

	update_balance();
	calculo3();
}

function update_balance() {
	var total = Number($('#subtotal').val()) + Number($('#9').val());
	total = total.toFixed(0);

	$('#purchase_total').val(total);
}

function update_price() {
	var row = $(this).parents('.item-row:visible');
	var price = (row.find('.cost:visible').val() * row.find('.qty:visible').val()) - row.find('.dscto:visible').val() ;
	price = price.toFixed(0);
	isNaN(price) ? row.find('.price:visible').val('Nan') : row.find('.price:visible').val(price);
	update_subtotal();
}
function bind1() {
	$('.cost:visible').blur(update_price);
	$('.qty:visible').blur(update_price);
	$('.dscto:visible').blur(update_price);
}

function bind(main, modal) {
	var n = main.val();
	modal.empty();
	modal.append(n);
}

function bind2(main, modal) {
	var n = main.text();
	modal.empty();
	modal.append(" " + n);
}