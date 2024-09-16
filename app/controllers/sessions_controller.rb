class SessionsController < ApplicationController

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    
    binding.pry
    if user.valid?
      session[:user.id] = user.id
      redirect_to user_dashboard_index_path(user)
    else
      redirect_to "/login"
    end
  end
end