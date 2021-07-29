class User < ApplicationRecord
  has_many :albums, class_name: "Album", dependent: :destroy
  has_many :photos, class_name: "Photo", dependent: :destroy
end
