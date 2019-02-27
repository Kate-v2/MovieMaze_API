
require 'rails_helper'
require 'api_helper'


RSpec.describe "OMDb Service" do

  include APIHelper
  include StubOMDb

  let(:filter) { {title: "bojack"} }
  let(:omdb)   { OmdbService.new(filter) }
  let(:data)   { omdb.get_data }

  before(:each) do
    stub_omdb
  end

  it 'gets movie matches data' do
    expect(data.class).to eq(Hash)
    keys = data.keys
    expect(keys).to include(:Title)
    expect(keys).to include(:Year)
    expect(keys).to include(:Rated)
    expect(keys).to include(:Runtime)
    expect(keys).to include(:Genre)
    expect(keys).to include(:Director)
    expect(keys).to include(:Actors)
    expect(keys).to include(:Plot)
    expect(keys).to include(:Awards)
    expect(keys).to include(:Poster)
    expect(keys).to include(:imdbRating)
    expect(keys).to include(:Type)
  end

  describe 'Private or Class Methods' do
    # TO DO - TEST METHODS with spies
  end


end
