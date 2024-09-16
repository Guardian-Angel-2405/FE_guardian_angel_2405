class SessionsController < ApplicationController

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    
    binding.pry
    if user.valid?
      session[:user.id] = user.id
      redirect_to "/users/#{session[:user.id]}/dashboard"
    else
      redirect_to "/login"
    end
  end
end