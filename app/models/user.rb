class User < ApplicationRecord
  # validations
  has_secure_password
  validates_uniqueness_of :profile_url, on: :create, message: "profile url already taken"
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :profile_url

  # associations
  has_many :albums, class_name: "Album", dependent: :destroy
  has_many :photos, class_name: "Photo", dependent: :destroy
  has_many :followers, class_name: "Followship", foreign_key: "receiver_id", inverse_of: "receiver" #inverse_of to minimize querys
  has_many :following, class_name: "Followship", foreign_key: "sender_id", inverse_of: "sender"
end
