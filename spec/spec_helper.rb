require "whisky"
require "rspec"
require "rack/test"

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Rack::Test::Methods

  def app
    Whisky::Application.new
  end
end

