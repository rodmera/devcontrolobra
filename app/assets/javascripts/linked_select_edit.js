jQuery(function() {
  
  var items2;
  items2 = $('#purchase_partida_edit').html();

  return $('#purchase_Proyecto_edit').blur(function() {
  
    var proyecto, options;
    
    proyecto = $('#purchase_Proyecto_edit :selected').text();
    //escaped_proyecto = proyecto.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '_');
    //alert(proyecto);
    
    options = $(items2).filter("optgroup[label=" + proyecto + "]").html();
    console.log(options);

    if (options) {
      return $('#purchase_partida_edit').html(options);
    } else {
      return $('#purchase_partida_edit').empty();
    }
  });




});
