json.extract! product, :id, :id_product, :id_purchase, :id_order, :id_project, :id_item, :id_metric, :nombre, :descripcion, :valor_unitario, :valor_total, :cant, :created_at, :updated_at
json.url product_url(product, format: :json)
