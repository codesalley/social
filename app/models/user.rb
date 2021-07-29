class User < ApplicationRecord
  has_many :albums, class_name: "Album"
  has_many :photos, class_name: "Photo"
end
