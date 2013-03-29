require "whisky/version"
require "whisky/routing"

module Whisky
  class Application
    def call(env)
      case env["PATH_INFO"]
      when '/favicon.ico'
        return [404, { "Content-Type" => "text/html" }, []]
      when '/'
        return [200, { "Content-Type" => "text/html" }, ["Hello Whisky!"]]
      else
        klass, action = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(action)
        [200, { "Content-Type" => "text/html" }, [text]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
