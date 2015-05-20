require "runways/version"
require "runways/array"
require "runways/routing"
require "runways/util"
require "runways/dependencies"
require "runways/controller"
require "runways/file_model"

module Runways

  class Application

    def call(env)

      #This is to avoid seeing an error on the server for favicon not found.
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
        {'Content-Type' => 'text/html'}, []]
      end

      rack_app = get_rack_app(env)
      rack_app.call(env)

    end
  
  end

end
