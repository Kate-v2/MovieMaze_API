
require 'rails_helper'
require 'api_helper'

require './spec/fixtures/stub_utelly'

RSpec.describe "Utelly Service" do

  include APIHelper
  include StubUtelly

  let(:filter) { {term: "bojack"} }
  let(:utelly) { UtellyService.new(filter) }
  let(:data)   { utelly.get_data }

  before(:each) do
    stub_utelly
  end

  it 'gets movie matches data' do
    # binding.pry
    expect(data.class).to eq(Hash)
    keys = data.keys
    expect(keys).to include(:term)
    expect(keys).to include(:results)

    results = data[:results]
    expect(results.class).to eq(Array)
    keys = results.first.keys
    expect(keys).to include(:picture)
    expect(keys).to include(:name)
    expect(keys).to include(:locations)

    streams = results.first[:locations]
    expect(streams.class).to eq(Array)
    keys = streams.first.keys
    expect(keys).to include(:display_name)
    expect(keys).to include(:url)
  end

  describe 'Private or Class Methods' do
    # TO DO - TEST METHODS with spies
  end


end
