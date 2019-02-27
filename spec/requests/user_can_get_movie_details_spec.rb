require 'rails_helper'
require 'api_helper'


RSpec.describe Api::V1::MovieController, type: :controller do

  include APIHelper

  let(:movie)   { {title: "bojack"} }
  let(:json)    { movie.to_json }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }
  #
  describe 'Success' do

    before(:each) do
      stub_omdb
      request.headers.merge!(headers)
      post :index, params: {}, body: json, format: :json, as: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns results for a movie search term' do
      raw  = get_json
      json = raw[:data][:attributes][:details]
      expect(json.class).to eq(Hash)
      keys = json.keys
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

  end


end
