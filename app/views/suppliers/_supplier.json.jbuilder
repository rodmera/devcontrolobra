json.extract! supplier, :id, :name, :razon_social, :rut, :giro, :estado, :observaciones, :fecha_inicio, :direccion_l1, :direccion_l2, :cod_postal, :comuna, :ciudad, :region, :pais, :telefono, :sitio_web, :credito, :plazo_pago, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
