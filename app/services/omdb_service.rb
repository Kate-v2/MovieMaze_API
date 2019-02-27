

class OmdbService

  def initialize(filter)
    @filter   = filter
    @title    = filter[:title]
    @base_url = 'http://www.omdbapi.com/'
  end

  def get_data
    get_json( format_query )
  end

  private

  def format_query
    "?apikey=#{ENV['omdb_key']}&t=#{@title}"
  end

  def get_json(url)
    response = get_movie( url )
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_movie(url)
    omdb_connection.get(url)
  end

  def omdb_connection
    Faraday.new(url: @base_url)
  end


end
