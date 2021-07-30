require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "Create new user, name profile_url email and password are required" do
    before(:all) do
      user = User.all
      user.each { |e| e.destroy }
    end
    it "should not save user if any of the required fileds is omitted" do
      newUser = User.create(name: "new user", password: "testtest", password_confirmation: "testest")
      expect(newUser.save).to eq(false)
    end
    it "should not save user if password and password confirmations doesn't match" do
      newUser = User.create(email: "codesalley@email.com", name: "new user", profile_url: "cutcat", password: "testtest", password_confirmation: "testes")
      expect(newUser.save).to eq(false)
    end
    it "should save when all required fileds are provided" do
      newUser = User.create(email: "codesalley@email.com", name: "user", profile_url: "cutcat", password: "testtest", password_confirmation: "testtest")
      expect(newUser.save).to eq(true)
      expect(User.last.name).to eq("user")
    end
  end

  describe "GET / shoueld render users#index and redirect to login path since user is not signed in " do
    before { get :index }
    it { should redirect_to(login_path) }
  end
end
