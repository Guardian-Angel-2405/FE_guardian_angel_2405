class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.first_name}!"
    redirect_to user_dashboard_index_path(new_user.id)
  end
  
  def update
    user = User.find(params[:user_id])
    if user.update(user_params)
      redirect_to user_dashboard_index_path(user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end
  
  def edit
    user = User.find(params[:user_id])
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}!"
      redirect_to user_dashboard_index_path(user.id)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number)
  end
end