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
end