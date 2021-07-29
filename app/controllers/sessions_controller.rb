class SessionsController < ApplicationController
  def login
  end

  def login_session
    user = User.find_by(profile_url: params[:profile_url])
    p user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back"
    else
      flash[:alert] = "Try again"
      render :login
    end
  end

  def signup
  end

  def signup_session
    p params
    user = User.create(users_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Account created"
    else
      flash[:alert] = "Try again"
      render :signup
    end
  end

  def logout
  end

  private

  def users_params
    params.require(:user).permit(:name, :profile_url, :email, :password, :password_confirmation)
  end
end
