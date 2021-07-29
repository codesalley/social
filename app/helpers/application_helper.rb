module ApplicationHelper
  def current_user
    user = User.find(session[:user_id]) unless session[:user_id].nil?
    if user
      return user
    end
  end
end
