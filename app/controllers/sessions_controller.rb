class SessionsController < ApplicationController

  # followed Railscast PRO #241: Simple OmniAuth
  # episode to set up OAuth 1.0a sign in feature
  # https://www.youtube.com/watch?v=KOnRf1K6Eg8
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to photos_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
