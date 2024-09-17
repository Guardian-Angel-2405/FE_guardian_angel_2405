class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def helpline_poros(helplines)
    helplines.map do |helpline|
      Helpline.new(helpline)
    end
  end
end
