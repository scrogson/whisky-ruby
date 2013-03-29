require "whisky/version"

module Whisky
  class Application
    def call(env)
      [200, { "Content-Type" => "text/html" }, ["Hello Whisky!"]]
    end
  end
end
