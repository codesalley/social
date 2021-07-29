class UsersController < ApplicationController
  before_action :authenicate_user

  def index
  end

  def profile
    @user = User.find_by(profile_url: params[:user])

    # catching params of random input
    if !@user
      render :errorparams
    end
    if @user.id == current_user.id
      @albums = @user.albums
      @album_arr = @user.albums.map { |ele| [ele.name, ele.id] }
      p @album_arr
    else
      @albums = @user.albums.public_albums
    end
  end

  def errorparams
  end

  def followers
  end

  def following
  end
end
