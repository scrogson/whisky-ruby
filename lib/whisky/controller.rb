module Whisky
  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", "#{view_name}.html.erb")
      template = File.read(filename)
      erb = Erubis::Eruby.new(template)
      erb.result(locals.merge(env: env))
    end
  end
end
