function calculo(){

  var qty=$("#qty");
  var unit_value=$("#unit_value");
  var total=isNaN(parseInt(qty.val()* unit_value.val())) ? 0 :(qty.val()* unit_value.val())
  $("#total_neto").val(total);


	//tasa de impuesto
  var tasa = 19;
  
  //monto a calcular el impuesto
  var monto = $("input[id=total_neto]").val();
  
  //calsulo del impuesto
  var iva = parseFloat((monto * tasa)/100) ;


  
  //se carga el iva en el campo correspondien te
  $("input[id=iva]").val(iva);
  
  //se carga el total en el campo correspondiente
  $("input[id=valor_total]").val(parseInt(monto)+parseFloat(iva));
}

function calculo2(){
    //alert(parseFloat($("#purchase_impuesto1").val()));
    if ($("#purchase_impuesto1").val() < 0) 
    {
      alert("Ingrese % Impuesto Válido");
        $("#purchase_impuesto1").val(0);
    }
    else
    {
  //tasa de impuesto
    var tasa = parseFloat($("#purchase_impuesto1").val());
    //monto a calcular el impuesto
    var monto = $("#subtotal").text();
    //calculo del impuesto
    var iva = parseFloat((monto * tasa)/100) ;
    //se carga el iva en el campo correspondien te
    $("#9").val(iva);
    //alert($('#purchase_impuesto1').val());
    //alert($('#9').val());
    //se carga el total en el campo correspondiente
    $("#purchase_total").val(parseInt(monto)+parseFloat(iva));

    update_balance();
    }
}

function calculo3(){
    //alert(parseFloat($("#purchase_impuesto1").val()));
    if ($("#purchase_impuesto1").val() < 0) 
    {
      alert("Ingrese % Impuesto Válido");
        $("#purchase_impuesto1").val(0);
    }
    else
    {
  //tasa de impuesto
    var tasa = parseFloat($("#purchase_impuesto1").val());
    //monto a calcular el impuesto
    var monto = $("#subtotal").val();
    //calculo del impuesto
    var iva = Math.round(parseFloat((monto * tasa)/100)) ;
    //se carga el iva en el campo correspondien te
    $("#9").val(iva);

    var total = Math.round(parseInt(monto)+parseFloat(iva));

    var total1 = total.toLocaleString();
    //alert($('#purchase_impuesto1').val());
    //alert($('#9').val());
    //se carga el total en el campo correspondiente
    $("#purchase_total").val(total1);

    update_balance();
    }
}


