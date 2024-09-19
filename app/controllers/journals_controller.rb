class JournalsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @journals = JournalService.get_dates(@user.id)
    # refactor this:
    # helpline_poros(@helplines)
    # if @helplines.is_a?(Hash) && @helplines[:error]
    #   flash[:error] = @helplines[:error]
    #   @helplines = []
    # end
    binding.pry
  end

  def show
    @user = User.find(params[:user_id])
    @date= params[:id]
    @journal = JournalService.get_gratitude(@user.id, @date_id)
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
end