class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
    @orders = Order.all
        @items = Item.all
        @metrics = Metric.all
        @projects = Project.all
        @invoices_count = Invoice.group(:id_supplier).count
        @invoices_and_orders = Invoice.all_with_order_details
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @user_email = current_user.email
  end

  # GET /invoices/1/edit
  def edit
    @user_email = current_user.email
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to action: "index", notice: 'Documento Ingresado'}
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    @user_email = current_user.email
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to action: "index", notice: 'Documento Actualizado' }
        format.json { render :index, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Documento Eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.fetch(:invoice, {}).permit(:updated_by, :created_by, :estado_pago, :estado_documento, :id_invoice, :tipo_doc, :id_product, :id_purchase, :order_id, :id_project, :id_item, :id_metric, :id_supplier, :id_ccosto, :fecha_recepcion, :fecha_ingreso, :estado, :descripcion, :valor_neto, :valor_iva, :valor_total)
    end
        respond_to do |format|
          format.html
          format.csv { send_data @invoices.to_csv, filename: "Gastos-#{Date.today}.csv" }
          format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="Gastos-#{Date.today}.xlsx"' }
        end # del respond_to para exportar
end