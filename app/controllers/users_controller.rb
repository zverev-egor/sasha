class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy
  # before_action :only_for_admin

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    # @user_teachers = User.where("roles='teacher'").all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    # @otziv = Review.where("user_id=current_user.id").all
    # @user_teacher = Use r.where("roles='teacher'").find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)
  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to users_path, notice: 'Пользователь успешно создан.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "Welcome to the Sample App!"
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  def create
    @user = User.new(user_params)
    if @user.save
      # if current_user.try('admin?') || current_user.try('master?')
      flash[:success] = 'Регистрация выполнена.'
      redirect_to root_path
      # else
      #   session[:user_id]=@user.id
      #   flash[:success] = "Регистрация выполнена."
      #   redirect_to root_path
      # end
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'Пользователь успешно изменен.'
        format.html { redirect_to users_path}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json

  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'Пользователь успешно удален.' }
  #     format.json { head :no_content }
  #   end
  # end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь успешно удален."
    redirect_to users_url
  end

  def admin
    if current_user.try('admin?')
      @admin = User.where("roles=?", 'admin').all
    # else
    #   flash[:success] = "Вы не админ!"
    end
  end
  def master
      @master = User.where("roles=?", 'master').page(params[:page]).per(10)
    # else
    #   flash[:success] = "Вы не админ!"
  end
  def customer
    if current_user.try('admin?')
      @customer = User.where("roles=?", 'customer').all
    # else
      # flash[:success] = "Вы не админ!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if !params[:user][:roles].nil?
        if params[:user][:roles] != 'admin' && params[:user][:roles] != 'customer' &&params[:user][:roles] != 'master'
          params[:user][:roles] = ''
        end
      else
        params[:user][:roles] = 'customer'
      end
      params.require(:user).permit(:fio, :login, :password, :password_confirmation, :roles, :avatar)
    end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
