

class Api::V1::SearchController < ApplicationController

  def index
    term = params['term']
    @search = SearchPresenter.new(term)
    render_search_results
  end


  def render_search_results
    response.status = 200
    render json: MovieSearchResultsSerializer.new(@search)
  end





end
