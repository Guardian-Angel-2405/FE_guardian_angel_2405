class EmergencyServicesController < ApplicationController
  def index
    country_code = params[:country_code] || 'us'
    @helplines = HelplineService.get_helplines(country_code)

    if @helplines.is_a?(Hash) && @helplines[:error]
      flash[:error] = @helplines[:error]
      @helplines = []
    end
  end

  def show
    @helpline = HelplineService.get_helpline_details(params[:id])

    if @helpline[:error]
      flash[:error] = @helpline[:error]
      redirect_to emergency_services_path
    end
  end
end