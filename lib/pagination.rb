module Pagination
  DEFAULT_PER_PAGE = 10

  def paginate(collection, params)
    page = (params[:page] || 1).to_i
    per_page = (params[:per_page] || DEFAULT_PER_PAGE).to_i

    # Paginate the collection using slice
    paginated_collection = collection.slice((page - 1) * per_page, per_page)

    {
      paginated_data: paginated_collection || [],
      current_page: page,
      total_pages: (collection.size.to_f / per_page).ceil,
      total_count: collection.size
    }
  end
end
