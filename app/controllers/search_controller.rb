class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    return unless request.xhr?

    @from_date = params[:date_from]
    @to_date   = params[:date_to]

    @entries = current_user.search_entries(@from_date, @to_date)

    respond_to do |format|
      format.js
    end
  end
end
