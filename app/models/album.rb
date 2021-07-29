class Album < ApplicationRecord
  validates_presence_of :name
  validates_length_of :photos, maximum: 10
  has_many :photos, class_name: "Photo", dependent: :destroy
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  scope :public_albums, -> { where("public =?", true) }
end
