require "rails_helper"

RSpec.describe Album, type: :model do
  describe "Album modal associations, user can have have many albums but each album will have max photos of 10" do
    it { should have_many(:photos).class_name(:Photo).dependent(:destroy) }
    it { should validate_length_of(:photos) }
    it { should belong_to(:user).class_name("User") }
  end
end
