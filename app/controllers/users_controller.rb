class UsersController < ApplicationController
  before_action :current_user

  def index
  end

  def profile
    p params
    @user = User.find_by(profile_url: params[:user])
  end

  def new
    @user = User.new
  end

  def update
  end

  def destroy
  end

  def followers
  end

  def following
  end
end
