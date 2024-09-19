class JournalsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @journals = JournalService.get_dates(@user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @date = params[:id]
    @journal = JournalService.get_gratitude(@user.id, @date_id)
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])

    connection = Faraday.new(url: 'https://guardian-angel-be-b74ba0b4e0bc.herokuapp.com')
  
    response = connection.post("/api/v0/gratitudes") do |gratitude|
      gratitude.params[:user_id] = params["user_id"]
      gratitude.params[:date] = params["date"]
      gratitude.params[:entry] = params["entry"]
      gratitude.headers['Content-Type'] = 'application/json'
    end

    redirect_to user_journals_path(user)
  end
end