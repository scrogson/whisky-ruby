require "whisky/version"
require "whisky/router"
require "whisky/utils"
require "whisky/object"
require "whisky/controller"
require "whisky/cask/json"

module Whisky
  class Application
    def call(env)
      case env["PATH_INFO"]
      when '/favicon.ico'
        return [404, { "Content-Type" => "text/html" }, []]
      when '/'
        return [200, { "Content-Type" => "text/html" }, ["Hello Whisky!"]]
      else
        klass, action = Router.get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(action)
        if controller.get_response
          status, headers, response = controller.get_response.to_a
          [status, headers, [response.body].flatten]
        else
          controller.render_response(action)
        end
      end
    end
  end
end
