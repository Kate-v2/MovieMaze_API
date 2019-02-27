require 'rails_helper'
require 'api_helper'


RSpec.describe Api::V1::SearchController, type: :controller do

  include APIHelper

  let(:movie)   { {term: "bojack"} }
  let(:json)    { movie.to_json }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }
  #
  describe 'Success' do

    before(:each) do
      stub_utelly
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
      json = raw[:data][:attributes]
      keys = json.keys
      expect(keys).to include(:term)
      expect(keys).to include(:results)

      results = json[:results]
      expect(results.class).to eq(Array)
      keys = results.first.keys
      expect(keys).to include(:title)
      expect(keys).to include(:picture)
      expect(keys).to include(:streams)

      streams = results.first[:streams]
      expect(streams.class).to eq(Array)
      keys = streams.first.keys
      expect(keys).to include(:service)
      expect(keys).to include(:url)
    end

  end


end
