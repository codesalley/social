require "rails_helper"

RSpec.describe Followship, type: :model do
  describe "Followship a table to hold followship, keep track of who the sender and receiver is" do
    it { should belong_to(:sender).class_name("User").with_foreign_key(:sender_id) }
    it { should belong_to(:receiver).class_name("User").with_foreign_key(:receiver_id) }
  end
end
