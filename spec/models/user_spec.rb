require "rails_helper"

RSpec.describe User, type: :model do
  describe "user model associations" do
    it { should have_many(:albums).class_name("Album").dependent(:destroy) }
    it { should have_many(:photos).class_name("Photo").dependent(:destroy) }
  end
  describe "Using followship model to keep records of who send who a request" do
    it { should have_many(:followers).class_name("Followship").with_foreign_key(:receiver_id) }
    it { should have_many(:following).class_name("Followship").with_foreign_key(:sender_id) }
  end
end
