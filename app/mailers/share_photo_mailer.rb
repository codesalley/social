class SharePhotoMailer < ApplicationMailer
  def share
    @url = params[:url]
    @sender = params[:sender]
    mail(to: params[:email], subject: "#{@sender} Shared a photo with you")
  end
end
