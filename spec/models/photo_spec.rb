require "rails_helper"

RSpec.describe Photo, type: :model do
  describe "Photo model associations, belongs to both the user and album, this will enable us perform CRUD on images individually " do
    it { should belong_to(:album).validate(true) }
    it { should belong_to(:user).class_name(:User).with_foreign_key(:user_id) }
  end
end
