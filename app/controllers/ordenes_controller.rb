class OrdenesController < ApplicationController
    before_action :set_orden, only: [:show, :edit, :update, :destroy]
    PAGE_SIZE = 20
       
  # GET /ordenes
  # GET /ordenes.json
      def index

  def show
  end

  def new
    @orden = Orden.new
  end

# GET /ordenes/1/edit
  def edit
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @orden = Orden.new(orden_params)
      if @orden.save
        format.html { redirect_to ordenes_url, notice: 'Solicitud creada.' }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to ordenes_url, notice: 'Solicitud actualizada.' }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @orden.destroy
      respond_to do |format|
        format.html { redirect_to ordenes_url, notice: 'Solicitud eliminada.' }
        format.json { head :no_content }
    end
  end

    private
    def set_orden
      @orden = Orden.find(params[:id])
    end

    private
    def orden_params
      params.require(:orden).permit(:PSolicita, :Num_Solicitud, :Estado, :Fecha_Creacion, :Fecha_OC, :Centro_Costo)
    end

        respond_to do |format|
          format.html
          format.csv { send_data @ordenes.to_csv, filename: "ordenes-#{Date.today}.csv" }
          format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="solicitudes_compras.xlsx"' }
        end # del respond_to para exportar
end
