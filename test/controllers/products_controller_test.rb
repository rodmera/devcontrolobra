require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { cant: @product.cant, descripcion: @product.descripcion, id_item: @product.id_item, id_metric: @product.id_metric, id_order: @product.id_order, id_product: @product.id_product, id_project: @product.id_project, id_purchase: @product.id_purchase, nombre: @product.nombre, valor_total: @product.valor_total, valor_unitario: @product.valor_unitario } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { cant: @product.cant, descripcion: @product.descripcion, id_item: @product.id_item, id_metric: @product.id_metric, id_order: @product.id_order, id_product: @product.id_product, id_project: @product.id_project, id_purchase: @product.id_purchase, nombre: @product.nombre, valor_total: @product.valor_total, valor_unitario: @product.valor_unitario } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
