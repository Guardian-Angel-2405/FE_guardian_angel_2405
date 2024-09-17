class SessionsController < ApplicationController

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.valid?
      session[:user_id] = user.id #research this and where it goes and why it is here?
      #session[:token] =          #same here
      redirect_to "/users/#{session[:user_id]}/dashboard"
    else
      redirect_to "/login"
    end
  end
end