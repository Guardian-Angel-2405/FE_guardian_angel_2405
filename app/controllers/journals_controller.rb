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
  end

  def show
    @user = User.find(params[:user_id])
    @date= params[:id]
    @journal = JournalService.get_gratitude(@user.id, @date_id)
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])

    connection = Faraday.new(url: "http://localhost:3000")
    
    response = connection.post("/api/v0/gratitudes") do |gratitude|
      gratitude.params[:user_id] = params["user_id"]
      gratitude.params[:date] = params["date"]
      gratitude.params[:entry] = params["entry"]
    end
    
    redirect_to user_journals_path(@user)
  end
end