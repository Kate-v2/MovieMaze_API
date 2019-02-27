

class SearchPresenter

  def initialize(term)
    @term = term
  end

  def id
    0
  end

  def term
    get_data[:term]
  end

  def results
    returns = get_data[:results]
    s = returns.map { |r| MovieSearchResult.new(r) }
  end


  def get_data
    @_data = UtellyService.new( {term: @term} ).get_data
  end




end
