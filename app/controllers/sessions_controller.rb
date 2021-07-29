class SessionsController < ApplicationController
  def login
  end

  def login_session
  end

  def signup
  end

  def signup_session
    user = User.create()
  end

  def logout
  end
end
