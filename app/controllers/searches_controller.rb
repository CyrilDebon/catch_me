class SearchesController < ApplicationController
  def index
    if search_term.present?
      @stops = Stop.search_by_keyword(search_term)

      respond_to do |format|
        format.js # searches/index.js.erb
      end
    end
  end

  private

  def search_term
    params.dig(:search, :term)
  end
end
