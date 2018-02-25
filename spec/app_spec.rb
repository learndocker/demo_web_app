require 'spec_helper'

RSpec.describe App do
  it 'returns http success' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'creates a request record' do
    expect {
      get '/'
    }.to change(Request, :count).by(1)
    expect(Request.count).to eq(1)
  end
end
