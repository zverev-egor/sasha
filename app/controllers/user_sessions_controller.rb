class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(:root, notice: 'Вы успешно авторизовались.')
    else
      flash.now[:alert] = 'Неправильный логин или пароль'
      render action: 'new'
    end
  end


  def destroy
    logout
    redirect_to(:root, notice: 'Вы успешно вышли.')
  end
end