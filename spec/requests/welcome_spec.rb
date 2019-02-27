
require 'rails_helper'
require 'api_helper'

RSpec.describe WelcomeController, type: :controller do

  it 'can go to welcome page' do
    get :index
    expect(response.status).to eq(200)
  end

end
