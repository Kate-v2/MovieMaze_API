
require 'rails_helper'
require 'api_helper'

RSpec.describe SessionsController, type: :controller do

  include APIHelper

  let(:data) { {
                username: 'name',
                password: 'pw'
              } }

  describe 'Success' do

    before(:each) do
      @user = User.create(  username: data[:username],
                            password: data[:password],
                            email:    'email',
                            token:    '1234abc'
                          )
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = data.to_json
      post :create, params: {}, body: json, format: :json, as: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'status 200' do
      expect(response.status).to eq(200)
    end

    it 'logs in' do
      raw  = get_json
      json = raw[:data][:attributes]
      expect(json[:token]).to eq(User.last.token)
    end

  end

  describe 'Failure' do

    it 'is unsuccessful if user does not exists' do
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = data.to_json
      post :create, params: {}, body: json, format: :json, as: :json
      expect(response.status).to eq(400)
    end

    it 'is unsuccessful if password is not correct' do
      @user = User.create(  username: data[:username],
                            password: data[:password],
                            email:    'email',
                            token:    '1234abc'
                          )
      input = data; input[:password] = "p"
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = input.to_json
      post :create, params: {}, body: json, format: :json, as: :json
      expect(response.status).to eq(400)
    end

  end

end
