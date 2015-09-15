class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  # before_action :only_for_admin

  # GET /knowledges
  # GET /knowledges.json
  def index
    @service = params[:id].to_i > 0 ? Service.find(params[:id]) : nil
    @services = @service.nil? ? Service.where(:service_id => 0).all : Service.where(:service_id => @service.id).where.not(:id => @service.id).all
  end

  # GET /knowledges/1
  # GET /knowledges/1.json
  def show
  end

  # GET /knowledges/new
  def new
    @service = Service.new
  end

  # GET /knowledges/1/edit
  def edit
  end

  # POST /knowledges
  # POST /knowledges.json
  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to services_path(:id => @service.is_folder == 1 ? @service.id : @service.service_id), notice: 'Объект успешно создан.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledges/1
  # PATCH/PUT /knowledges/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_path(:id => @service.is_folder == 1 ? @service.id : @service.knowledge_id), notice: 'Объект успешно изменен.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges/1
  # DELETE /knowledges/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url(:id => @service.service_id), notice: 'Объект успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:is_folder, :service_id, :name, :description)
  end
end
