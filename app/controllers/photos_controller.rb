class PhotosController < ApplicationController
  before_action :authenicate_user

  def create
    selected_album = Album.find(params[:album_id])
    selected_album.photos.build(image: params[:image], user_id: current_user.id)

    if selected_album.save
      redirect_to "/#{current_user.profile_url}", notice: "Photo Added"
    else
      flash[:alert] = "Try Again"
      redirect_to "/#{current_user.profile_url}"
    end
  end

  private

  def phot_params
    params.require(:photo).permit(:image)
  end
end
