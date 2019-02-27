
module StubUtelly

  def stub_utelly_path
    "./spec/fixtures/api/v1/utelly_bojack.json"
  end

  def stub_utelly
    base    = 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup'
    term    = 'bojack'
    country = '&country=us'
    url     = base + "?term=" + term + country
    stub_request(:get, url).
      to_return(body: File.read( stub_utelly_path ) )
  end
  # with(headers: { 'X-RapidAPI-Key': ENV['utelly_key'] }).

end
