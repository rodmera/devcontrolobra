class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :all_items, only: [:show, :index, :create, :update, :destroy]
	
    def index
		@items = Item.all
        @metrics = Metric.all
        @projects = Project.all

        respond_to do |format|
            format.html
            format.json
        end
	end

    def update_row_order
        @item = Item.find(item_params[:item_id])
        @item.row_order_position = item_params[:row_order_position]
        @item.save

        render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    # GET /ordenes/1/edit
    def edit
        #@project = Project.find(params[:ccosto])
        #@item = Item.find(params[:id])
    end

	def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
        @item.metrics.build 
        @projects = Project.all
        @project = Project.find(params[:id])
    end

    def destroy
        @item.destroy
            respond_to do |format|
                format.html { redirect_to items_url, notice: 'Partida eliminada.' }
                format.json { head :no_content }
            end
    end

    def update
        #@project = Project.find(params[:ccosto])
        respond_to do |format|
            if @item.update(item_params)
                
                format.html { redirect_back(fallback_location: projects_path, notice: 'Partida Actualizada.')}
                format.json { render :show, status: :ok, location: @item }
            else
                format.html { render :edit }
                format.json { render json: @item.errors, status: :unprocessable_entity }
            end
        end
    end

    def create
        @item = Item.new(item_params)
        #@project = Project.find(params[:id])
        #@project = Project.find(params[:ccosto])
        #@suppliers = Supplier.all

        respond_to do |format|
          if @item.save
            format.html { redirect_back(fallback_location: projects_path, notice: 'Partida Creada.')}
            format.json { render :show, status: :created, location: @item }
          else
            format.html { render :new }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
    end    

    private
        def all_items
        @items = Item.all
        end

        def set_item
        @item = Item.find(params[:id])
        end
        
        def item_params
            
            params.fetch(:item, {}).permit(:project_id, :id, :nombre, :id_item, :item_id, :cant, :valor_ppto, :valor_real, :ccosto, :id_oc_as, :id_soc_as, :metric, :descripcion, :id_project)
        end
    end