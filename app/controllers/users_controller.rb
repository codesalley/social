class UsersController < ApplicationController
  before_action :authenicate_user

  def index
    @users = User.all
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
    else
      @albums = @user.albums.public_albums
    end
  end

  def errorparams
  end

  def share
    SharePhotoMailer.with(email: params[:email], sender: current_user.name, url: params[:url]).share.deliver_later
  end

  def follow
    follower = User.find_by(profile_url: params[:profile])
    friendship_to = Followship.find_by(sender_id: current_user.id, receiver_id: follower.id)

    if friendship_to
      flash[:alert] = "already following"
      redirect_to root_path
      return
    end
    connection = current_user.following.build(receiver_id: follower.id)
    if connection.save
      p current_user.following
      redirect_to root_path, notice: "connection sent"
    else
      flash[:alert] = "Try again"
      redirect_to root_path
    end
  end
end
