class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:edit, :update, :destroy]
  before_action :only_for_admin, only: [:edit, :update, :destroy, :create]
  # GET /welcomes
  # GET /welcomes.json
  def index
    @welcomes = Welcome.all
  end


  # GET /welcomes/new
  def new
    if Welcome.count==0
      @welcome = Welcome.new
    else
      redirect_to root_path
    end
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes
  # POST /welcomes.json
  # def create
  #   @welcome = Welcome.new(welcome_params)
  #
  #   respond_to do |format|
  #     if @welcome.save
  #       format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
  #       format.json { render :show, status: :created, location: @welcome }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @welcome.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    if Welcome.count==0
      @welcome = Welcome.new(welcome_params)
      if @welcome.save
        flash[:success] = 'Главная страница созданна.'
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  # # PATCH/PUT /welcomes/1
  # # PATCH/PUT /welcomes/1.json
  # def update
  #   respond_to do |format|
  #     if @welcome.update(welcome_params)
  #       format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @welcome }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @welcome.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def update
    if @welcome.update(welcome_params)
      flash[:success] = 'Главная страница изменена'
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @welcome = Welcome.find(params[:id])
  end
  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome.destroy
    respond_to do |format|
      flash[:success] = 'Данные с главной страницы удалены.'
      format.html { redirect_to welcomes_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.require(:welcome).permit(:description)
    end
end
