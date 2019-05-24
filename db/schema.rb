# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170923181324) do

  create_table "comunas", primary_key: "id", force: :cascade do |t|
    t.integer "id_region",                      null: false, comment: "ID de la region asociada"
    t.string  "name", limit: 30,              comment: "Nombre descriptivo de la comuna"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "id_invoice"
    t.string   "id_product"
    t.string   "id_purchase"
    t.string   "order_id"
    t.string   "id_project"
    t.string   "id_item"
    t.string   "id_metric"
    t.string   "id_supplier"
    t.string   "id_ccosto"
    t.string   "tipo_doc"
    t.date     "fecha_recepcion"
    t.datetime "fecha_ingreso"
    t.string   "estado_pago"
    t.string   "estado_documento"
    t.string   "descripcion"
    t.decimal  "valor_neto",       precision: 10
    t.decimal  "valor_iva",        precision: 10
    t.decimal  "valor_total",      precision: 10
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "nombre",                                null: false
    t.string   "id_item"
    t.string   "id_project"
    t.string   "project_id"
    t.string   "metric",      limit: 50
    t.integer  "cant"
    t.string   "descripcion"
    t.decimal  "valor_ppto",             precision: 10
    t.decimal  "valor_real",             precision: 10
    t.decimal  "valor_total",            precision: 10
    t.string   "ccosto"
    t.string   "id_oc_as"
    t.string   "id_soc_as"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
  end

  create_table "metrics", force: :cascade do |t|
    t.integer  "number"
    t.string   "item_id"
    t.text     "name",         limit: 65535
    t.text     "unit",         limit: 65535
    t.date     "date"
    t.integer  "state"
    t.integer  "user_id"
    t.text     "product_type", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "PSolicita"
    t.string   "descripcion"
    t.string   "Num_Solicitud"
    t.string   "estado"
    t.string   "doc_name"
    t.date     "Fecha_Creacion"
    t.date     "Fecha_OC"
    t.string   "project_id"
    t.string   "Centro_Costo"
    t.string   "item_id"
    t.string   "supplier_id"
    t.string   "supplier_rut"
    t.string   "supplier_alias"
    t.string   "supplier_dir"
    t.string   "supplier_razonsocial"
    t.string   "supplier_fono"
    t.string   "currency"
    t.decimal  "subtotal1",            precision: 10
    t.decimal  "amount",               precision: 10
    t.string   "despacho"
    t.string   "comuna"
    t.string   "impuesto1"
    t.string   "monto_impuesto"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "id_product"
    t.string   "id_purchase"
    t.string   "order_id"
    t.string   "id_project"
    t.string   "id_item"
    t.string   "id_metric"
    t.string   "nombre"
    t.string   "descripcion"
    t.decimal  "valor_unitario", precision: 10
    t.string   "descuento"
    t.string   "total_neto"
    t.decimal  "iva",            precision: 10, scale: 1
    t.decimal  "valor_total",    precision: 10
    t.integer  "cant"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "descripcion"
    t.string   "estado"
    t.date     "fecha_inicio"
    t.date     "fecha_termino"
    t.integer  "plazoej"
    t.string   "ccosto"
    t.string   "comuna"
    t.string   "ciudad"
    t.string   "region"
    t.string   "mandante"
    t.decimal  "tcostodirecto",   precision: 10
    t.decimal  "gastosgenerales", precision: 10
    t.decimal  "utilidades",      precision: 10
    t.decimal  "tneto",           precision: 10
    t.decimal  "impuesto_iva",    precision: 10
    t.decimal  "toferta",         precision: 10
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "idoc"
    t.string   "id_order"
    t.string   "ccosto"
    t.string   "razon_social"
    t.string   "rut"
    t.string   "direccion"
    t.string   "comuna"
    t.string   "ciudad"
    t.date     "fecha"
    t.string   "atencion"
    t.string   "email"
    t.string   "fono"
    t.string   "cond_pago"
    t.date     "fecha_entrega"
    t.string   "despacho"
    t.string   "contacto_obra"
    t.string   "facturar_a"
    t.string   "rut_b"
    t.string   "direccion_b"
    t.string   "comuna_b"
    t.string   "ciudad_b"
    t.string   "fono_b"
    t.string   "descuento"
    t.decimal  "amount",        precision: 15, scale: 2
    t.string   "company"
    t.string   "contragent"
    t.string   "currency"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", primary_key: "id", id: :integer, comment: "ID unico", force: :cascade do |t|
    t.string  "name", limit: 60, null: false, comment: "Nombre extenso"
    t.string  "ordinal_symbol",      limit: 5,  null: false, comment: "Numero Romano"
    t.integer "order_by",                null: false, comment: "orden"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "razon_social"
    t.string   "alias"
    t.string   "rut"
    t.string   "giro"
    t.string   "estado"
    t.string   "observaciones"
    t.date     "fecha_inicio"
    t.string   "direccion_l1"
    t.string   "direccion_l2"
    t.string   "cod_postal"
    t.string   "comuna"
    t.string   "ciudad"
    t.string   "region"
    t.string   "pais"
    t.string   "telefono"
    t.string   "sitio_web"
    t.string   "credito"
    t.string   "plazo_pago"
    t.string   "p_nombrecontacto"
    t.string   "p_fonocontacto"
    t.string   "p_mailcontacto"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
