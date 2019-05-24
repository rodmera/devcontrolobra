class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show]

  # GET /invoices
  # GET /invoices.json
  def index
    @search = Purchase.search(params[:q])
    @purchases = @search.result
  end

  def search
    index
    render :index
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @purchase = Purchase.new
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:amount, :despacho, :company, :contragent, :currency, :date)
    end
end