$(document).ready(function(){
$.getJSON('http://mindicador.cl/api', function(data) {
    var dailyIndicators = data;
    //$("<p/>", {
    //    html: 'El valor actual de la UF es $' + dailyIndicators.uf.valor
    //}).appendTo("body");
    $("#UF").val(dailyIndicators.uf.valor);
    $("#dolar").val(dailyIndicators.dolar.valor);
}).fail(function() {
    console.log('Error al consumir la API!');
});
});