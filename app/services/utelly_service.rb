

class UtellyService

  def initialize(filter)
    @filter   = filter
    @term     = filter[:term]
    @base_url = 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup'
  end

  def get_data
    get_json( format_query )
  end

  private

  def format_query
    "?term=#{@term}&country=us"
  end

  def get_json(url)
    response = get_movies( url )
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_movies(url)
    utelly_connection.get do |req|
      req.url url
      req.headers['X-RapidAPI-Key'] = ENV['utelly_key']
    end
  end

  def utelly_connection
    Faraday.new(url: @base_url)
  end


end
