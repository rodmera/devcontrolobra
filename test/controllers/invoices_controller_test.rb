require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { descripcion: @invoice.descripcion, estado: @invoice.estado, fecha_ingreso: @invoice.fecha_ingreso, fecha_recepcion: @invoice.fecha_recepcion, id_ccosto: @invoice.id_ccosto, id_invoice: @invoice.id_invoice, id_item: @invoice.id_item, id_metric: @invoice.id_metric, id_order: @invoice.id_order, id_product: @invoice.id_product, id_project: @invoice.id_project, id_purchase: @invoice.id_purchase, id_supplier: @invoice.id_supplier, valor_iva: @invoice.valor_iva, valor_neto: @invoice.valor_neto, valor_total: @invoice.valor_total } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { descripcion: @invoice.descripcion, estado: @invoice.estado, fecha_ingreso: @invoice.fecha_ingreso, fecha_recepcion: @invoice.fecha_recepcion, id_ccosto: @invoice.id_ccosto, id_invoice: @invoice.id_invoice, id_item: @invoice.id_item, id_metric: @invoice.id_metric, id_order: @invoice.id_order, id_product: @invoice.id_product, id_project: @invoice.id_project, id_purchase: @invoice.id_purchase, id_supplier: @invoice.id_supplier, valor_iva: @invoice.valor_iva, valor_neto: @invoice.valor_neto, valor_total: @invoice.valor_total } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
