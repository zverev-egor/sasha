class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def only_for_admin
    if current_user.nil? || !current_user.admin?
      render :text=>"Доступ запрещен", :layout => 'application'
    end
  end
  def only_for_teacher
    if current_user.nil? || !current_user.teacher?
      render :text=>"Доступ запрещен", :layout => 'application'
    end
  end
  def only_for_student
    if current_user.nil? || !current_user.student?
      render :text=>"Доступ запрещен", :layout => 'application'
    end
  end



  def check_auth
     @current_user = current_user
     unless current_user
       redirect_to login_path
     end
     true
  end

end
