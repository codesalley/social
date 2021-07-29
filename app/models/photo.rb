class Photo < ApplicationRecord
  belongs_to :album, validate: true
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
