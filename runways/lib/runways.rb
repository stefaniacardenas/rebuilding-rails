require "runways/version"
# require "runways/array"
require "runways/routing"

module Runways

  class Application

    def call(env)

      # This is in order to prevent the error that complains about not having a favicon.ico
      # We return a 404
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
        {'Content-Type' => 'text/html'}, []]
      end

    	klass, act = get_controller_and_action(env)
    	controller = klass.new(env)
    	text = controller.send(act)
			# This line returns success (200) and state that this will be an html content type
      [200,{'Content-Type'=>'text/html'},
    	# This is the output of our call
        [text]]
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
