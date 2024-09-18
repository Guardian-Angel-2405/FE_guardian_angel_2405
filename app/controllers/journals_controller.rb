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
    @journal = Journal.find(params[:id])
  end
end