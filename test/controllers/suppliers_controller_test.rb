require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get suppliers_url
    assert_response :success
  end

  test "should get new" do
    get new_supplier_url
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post suppliers_url, params: { supplier: { ciudad: @supplier.ciudad, cod_postal: @supplier.cod_postal, comuna: @supplier.comuna, credito: @supplier.credito, direccion_l1: @supplier.direccion_l1, direccion_l2: @supplier.direccion_l2, estado: @supplier.estado, fecha_inicio: @supplier.fecha_inicio, giro: @supplier.giro, name: @supplier.name, observaciones: @supplier.observaciones, pais: @supplier.pais, plazo_pago: @supplier.plazo_pago, razon_social: @supplier.razon_social, region: @supplier.region, rut: @supplier.rut, sitio_web: @supplier.sitio_web, telefono: @supplier.telefono } }
    end

    assert_redirected_to supplier_url(Supplier.last)
  end

  test "should show supplier" do
    get supplier_url(@supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_url(@supplier)
    assert_response :success
  end

  test "should update supplier" do
    patch supplier_url(@supplier), params: { supplier: { ciudad: @supplier.ciudad, cod_postal: @supplier.cod_postal, comuna: @supplier.comuna, credito: @supplier.credito, direccion_l1: @supplier.direccion_l1, direccion_l2: @supplier.direccion_l2, estado: @supplier.estado, fecha_inicio: @supplier.fecha_inicio, giro: @supplier.giro, name: @supplier.name, observaciones: @supplier.observaciones, pais: @supplier.pais, plazo_pago: @supplier.plazo_pago, razon_social: @supplier.razon_social, region: @supplier.region, rut: @supplier.rut, sitio_web: @supplier.sitio_web, telefono: @supplier.telefono } }
    assert_redirected_to supplier_url(@supplier)
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete supplier_url(@supplier)
    end

    assert_redirected_to suppliers_url
  end
end
