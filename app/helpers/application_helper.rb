module ApplicationHelper
  def current_user
    user = User.find(session[:user_id])
    if user
      return user
    end
    redirect_to login_path
  end
end
