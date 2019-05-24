jQuery(function() {
  
  var items;
  items = $('#purchase_partida').html();

  return $('#purchase_Proyecto').change(function() {
  
    var proyecto, options, escaped_proyecto;
    
    proyecto = $('#purchase_Proyecto :selected').text();
    //escaped_proyecto = proyecto.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '_');
    //alert(proyecto);
    
    options = $(items).filter("optgroup[label=" + proyecto + "]").html();
    console.log(options);

    if (options) {
      return $('#purchase_partida').html(options);
    } else {
      return $('#purchase_partida').empty();
    }
  });
});
