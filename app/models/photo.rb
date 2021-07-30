class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :album, validate: true
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
