module Whisky
  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
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
      erb.result(locals.merge(
        env: env,
        controller_name: controller_name
      ))
    end
  end
end
