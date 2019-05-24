class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :all_products, only: [:index, :create, :update, :destroy]
  respond_to :html, :js
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @items = Item.all
    @metrics = Metric.all
    @projects = Project.all
   

        respond_to do |format|
            format.html
            format.json
        end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @orders = Order.all
    @product = Product.new
    @materiales = Product.all

  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @materiales = Product.all
  
    respond_to do |format|
      if @product.save
        format.html { redirect_back(fallback_location: orders_path, notice: 'Material Creado')}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to orders_path, notice: 'El Producto ha sido modificado'}
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: orders_path, notice: 'Material Eliminado')}
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def all_products
      @products = Product.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def order_params
      params.fetch(:order, {}).permit(:id, :PSolicita, :Num_Solicitud, :Estado, :Fecha_Creacion, :Fecha_OC, :Centro_Costo, :descripcion, :item_id, :id_item, :supplier_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params

      params.fetch(:product, {}).permit(:id, :iva, :total_neto, :id_product, :id_purchase, :id_order, :id_project, :id_item, :id_metric, :nombre, :descripcion, :valor_unitario, :valor_total, :cant)
    end
end