class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id].nil?
      redirect_to login_path
      return
    end
    user = User.find(session[:user_id])
    return user
  end

  def authenicate_user
    if session[:user_id].nil?
      redirect_to login_path
      return
    end
  end
end
