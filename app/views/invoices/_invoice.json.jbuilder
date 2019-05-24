json.extract! invoice, :id, :id_invoice, :id_product, :id_purchase, :id_order, :id_project, :id_item, :id_metric, :id_supplier, :id_ccosto, :fecha_recepcion, :fecha_ingreso, :estado, :descripcion, :valor_neto, :valor_iva, :valor_total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
