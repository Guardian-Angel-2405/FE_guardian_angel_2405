class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    flash[:success] = "Welcome, #{new_user.first_name}!"
    binding.pry
    redirect_to user_dashboard_index_path(new_user.id)
  end

  def update
  end
  
  def edit
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.first_name}!"
    redirect_to users_dashboard_index_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number)
  end
end