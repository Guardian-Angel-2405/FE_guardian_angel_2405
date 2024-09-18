class JournalsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])

    @journal = JournalService.get_dates(@user.id)

    binding.pry
    # refactor this:
    # helpline_poros(@helplines)
    # if @helplines.is_a?(Hash) && @helplines[:error]
    #   flash[:error] = @helplines[:error]
    #   @helplines = []
    # end
  end

  def show
    @user = User.find(params[:user_id])
    @entry = Journal.find(params[:id])
  end
end