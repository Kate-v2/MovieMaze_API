
class Movie

  def initialize(title)
    @title = title
  end

  def id
    0
  end

  def details
    puts get_data
    data = get_data.dup
    data.slice!(
      :Title,
      :Year,
      :Rated,
      :Runtime,
      :Genre,
      :Director,
      :Actors,
      :Plot,
      :Awards,
      :Poster,
      :imdbRating,
      :Type
    )
    data[:imdbRating] += "/10" if data[:imdbRating]
    # binding.pry
    puts data
    return data
  end

  private

  def get_data
    @_data ||= OmdbService.new( { title: @title } ).get_data
  end


end
