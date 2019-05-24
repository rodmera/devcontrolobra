$(document).ready(function() 
{
    var table = $('#datatable_projects').DataTable( {
        dom: 'B<"clear">lfrtip',
    buttons: [ 
    { extend: 'excel', text: '', className: 'btn btn-primary glyphicon glyphicon glyphicon-save btn-sm', exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5 ]
                } }

    ],
        paging: false,
        "autoWidth": true,
        "info": false,
    "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ registros",
        "sZeroRecords":   "No se encontraron resultados",
        "sEmptyTable":    "Ningún dato disponible en esta tabla",
        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
    });

       table.buttons().container()
        .appendTo( '#datatable_projects_wrapper ' );  

    var buttonCommon = {
        exportOptions: {
            format: {
                body: function ( data, row, column, node ) {
                    // Strip $ from salary column to make it numeric
                    return column >= 5 && column <= 6 ?
                        data.replace( /[$,.]/g, '' ) :
                        data;
                }
            },
            columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ],
        },
        className: 'btn btn-info fa fa-file-excel-o fa-2x btn-md', 
        text: ''
    };

    $('#datatable_orders').DataTable( {

        columns: [
            { data: 'ID' },
            { data: 'C.Costo' },
            { data: 'Partida' },
            { data: 'Proveedor' },
            { data: 'RUT Prov.' },
            { data: 'Monto Neto' },
            { data: 'Monto Total' },
            { data: 'Fecha Creación' },
            { data: 'Fecha Modif.' },
            { data: 'Estado' },
            { data: 'Solicita' },
            { data: 'Obs.' },
            { data: 'Acción' }
        ],

        dom: 'lfrtipB',
    buttons: [ 
    $.extend( true, {}, buttonCommon, {
        extend: 'excelHtml5'
    })
    ],

        paging: false,
        "autoWidth": true,
        "info": false,
    "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ registros",
        "sZeroRecords":   "No se encontraron resultados",
        "sEmptyTable":    "Ningún dato disponible en esta tabla",
        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
    });

        table.buttons().container()
        .appendTo( '#datatable_orders_wrapper');  
} );
