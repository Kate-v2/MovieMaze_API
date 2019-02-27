
class MovieSearchResult

  def initialize(data)
    @data = data
  end

  def picture
    @data[:picture]
  end

  def title
    @data[:name]
  end

  def streams
    @data[:locations].map { |l|
      {
        service: l[:display_name],
        url: l[:url]
      }
    }
  end

  # TO DO - maybe leave this to FE
  # def valid_services
  #   [
  #     "Amazon Instant",
  #     "Netflix",
  #
  #   ]
  # end


end
