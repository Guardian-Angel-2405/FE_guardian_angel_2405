class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)  
    
    if @user.save 
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name}!"
      redirect_to user_dashboard_index_path(@user.id)
    elsif !@user.save
      flash[:error] = "There was a problem creating your account. Please check the form for errors."
      render :new  
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id]) 
    if user.update(user_params)
      redirect_to user_dashboard_index_path(user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end
end