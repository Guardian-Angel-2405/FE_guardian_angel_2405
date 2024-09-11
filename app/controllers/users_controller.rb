class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])
    flash[:success] = "Welcome, #{user.username}!"
    redirect_to users_dashboard_index_path
  end
end