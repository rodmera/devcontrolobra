class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = Order.all
    @materiales = Product.where(id_order: @order.id)
    @product = Product.new

    respond_to do |format|
      format.pdf { render template: 'orders/order', pdf: "order" }
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.products.build
    @user_email = current_user.email
    @projects = Project.all
    #render json: @projects
  end

  def api
    render json: @projects
  end  

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @user_email = current_user.email
    @project = Project.where(:id => @order.project_id).pluck(:estado).first
  end

  def aprobar
    @order = Order.find(params[:id])
      @order.update_attribute(:estado, 'APROBADA')
      @order.update_attribute(:doc_name, 'ORDEN DE COMPRA')
      flash[:success] = "Solicitud Aprobada"
      respond_to do |format|
        format.html { redirect_to(action: :index)}
      end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    #@suppliers = Supplier.all

    respond_to do |format|
      if @order.save
        flash[:success] = "Solicitud Creada"
        OrderMailer.received(@order).deliver_now
        format.html { redirect_to(action: :index)}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @user_email = current_user.email
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to action: "index" }
        format.json { render :index, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Solicitud Eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def order_params
      params.fetch(:order, {}).permit(:project_id, :doc_name, :updated_by, :created_by, :monto_impuesto, :subtotal1, :supplier_fono, :supplier_razonsocial, :supplier_dir, :impuesto1, :estado, :project_id, :comuna, :centro, :currency, :amount, :despacho, :supplier_alias, :supplier_rut, :PSolicita, :Num_Solicitud, :Estado, :Fecha_Creacion, :Fecha_OC, :Centro_Costo, :descripcion, :item_id, :id_item, :supplier_id, products_attributes: [:id, :nombre, :descripcion, :cant, :valor_unitario, :descuento, :total_neto, :_destroy])
    end

end