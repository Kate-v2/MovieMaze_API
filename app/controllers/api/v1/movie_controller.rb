
class Api::V1::MovieController < ApplicationController

  def index
    title = params['title']
    @movie = Movie.new(title)
    render_movie
  end

  private

  def render_movie
    response.status = 200
    render json: MovieSerializer.new(@movie)
  end





end
