
require 'rails_helper'
require 'api_helper'

RSpec.describe UsersController, type: :controller do

  include APIHelper

  let(:data) { {
                username:              'name1',
                password:              'pw1',
                password_confirmation: 'pw1',
                email:                 'email1',
              } }

  describe 'Success' do

    before(:each) {
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = data.to_json
      post :create, params: {}, body: json, format: :json, as: :json
    }

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'status 200' do
      expect(response.status).to eq(201)
    end

    it 'creates & returns token' do
      raw  = get_json
      json = raw[:data][:attributes]
      expect(json[:token]).to eq(User.last.token)
    end

  end

  describe 'Failure' do

    it 'is unsuccessful if username exists' do
      user = User.make_user(data)
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = data.to_json
      post :create, params: {}, body: json, format: :json, as: :json
      expect(response.status).to eq(400)
    end

  end


end
