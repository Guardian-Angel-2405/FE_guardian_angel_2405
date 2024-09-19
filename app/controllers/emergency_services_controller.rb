class EmergencyServicesController < ApplicationController
  include Pagination # Include the pagination module

  def index
    country_code = params[:country_code] || 'us'
    helplines_data = HelplineService.get_helplines(country_code)
    
    # Convert raw data into Helpline POROs
    @helplines = helplines_data.map { |data| Helpline.new(data) }

    # Handle error scenario if the data is a hash containing an error key
    if @helplines.is_a?(Hash) && @helplines[:error]
      flash[:error] = @helplines[:error]
      @helplines = []
    else
      # Paginate the @helplines using the Pagination module
      pagination_result = paginate(@helplines, params)
      @paginated_helplines = pagination_result[:paginated_data]
      @current_page = pagination_result[:current_page]
      @total_pages = pagination_result[:total_pages]
    end
  end

  def show
    helpline_data = HelplineService.get_helpline_details(params[:id])
    if helpline_data[:error] || helpline_data['error']
      flash[:error] = helpline_data[:error] || helpline_data['error']
      @helpline = nil
    else
      @helpline = Helpline.new(helpline_data)
    end
  end
end