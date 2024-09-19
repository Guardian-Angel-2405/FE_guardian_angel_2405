class EmergencyServicesController < ApplicationController
  def index
    country_code = params[:country_code] || 'us'
    @helplines = HelplineService.get_helplines(country_code)
    # refactor this:
    helpline_poros(@helplines)
    if @helplines.is_a?(Hash) && @helplines[:error]
      flash[:error] = @helplines[:error]
      @helplines = []
    end
  end

  
  def show
    helpline_data = HelplineService.get_helpline_details(params[:id]) # Use get_helpline_details

    if helpline_data[:error] || helpline_data['error'] # Check for error in the raw data
      flash[:error] = helpline_data[:error] || helpline_data['error']
      @helpline = nil
      redirect_to emergency_services_path
    else
      @helpline = Helpline.new(helpline_data) # Initialize the Helpline PORO only if there's no error
    end
  end
end