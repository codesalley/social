require "rails_helper"

RSpec.describe User, type: :model do
  describe "user model associations" do
    it { should have_many(:albums).class_name("Album").dependent(:destroy) }
    it { should have_many(:photos).class_name("Photo").dependent(:destroy) }
  end
end
