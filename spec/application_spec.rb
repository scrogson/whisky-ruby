require "spec_helper"

describe 'Whisky' do

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'Hello Whisky!'
  end

end
