class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :profile_url, on: :create, message: "profile url already taken"
  has_many :albums, class_name: "Album", dependent: :destroy
  has_many :photos, class_name: "Photo", dependent: :destroy
  has_many :followers, class_name: "Followship", foreign_key: "receiver_id", inverse_of: "receiver" #inverse_of to minimize querys
  has_many :following, class_name: "Followship", foreign_key: "sender_id", inverse_of: "sender"
end
