require "rack/request"
require "whisky/cask"

module Whisky
  class Controller

    include Whisky::Cask

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def response(text, status = 200, headers = {})
      raise "Response already sent." if @response
      @response = Rack::Response.new([text].flatten, status, headers)
    end

    def get_response
      @response
    end

    def render_response(*args)
      response(render(*args))
    end

    def request
      @request ||= Rack::Request.new(@env)
    end

    def params
      request.params
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, '')
      Utils.underscore(klass)
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      erb = Erubis::Eruby.new(template)
      erb.result(binding())
    end
  end
end
