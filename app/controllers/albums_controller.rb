class AlbumsController < ApplicationController
  before_action :authenicate_user

  def create
    album = current_user.albums.build(album_params)
    if album.save
      redirect_to "/#{current_user.profile_url}", notice: "Album Added"
    else
      redirect_to "/#{current_user.profile_url}", alert: "Try again"
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :public)
  end
end
