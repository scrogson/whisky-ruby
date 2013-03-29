require "spec_helper"

describe 'Whisky' do

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should eq 'Hello Whisky!'
  end

  it "doesn't handle favicons" do
    get '/favicon.ico'
    last_response.status.should be 404
  end

end
