
module StubOMDb

  def stub_omdb_path
    "./spec/fixtures/api/v1/omdb_bojack.json"
  end

  def stub_omdb
    base    = 'http://www.omdbapi.com/'
    apikey  = "?apikey=#{ENV['omdb_key']}"
    term    = '&t=bojack'
    url     = base + apikey + term
    stub_request(:get, url).
      to_return(body: File.read( stub_omdb_path ) )
  end

end
