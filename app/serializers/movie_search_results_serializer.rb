
class MovieSearchResultsSerializer

  include FastJsonapi::ObjectSerializer

  attributes :id

  attribute :term { |r| r.term }

  attribute :results { |r|
    res = r.results
    res.map { |rez|
      {
        title:   rez.title,
        picture: rez.picture,
        streams: rez.streams,
      }
     }
   }

end
