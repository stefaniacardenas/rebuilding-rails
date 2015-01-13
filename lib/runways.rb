require "runways/version"

module Runways
  class Application
    def call(env)
    	#This line should create a file called debug.txt when executed
      `echo debug >debug.txt`
			# This line returns success (200) and state that this will be an html content type
      [200,{'Content-Type'=>'text/html'},
    	# This is the output of our call
        ["Hello from Ruby on Runways!"]]
    end
  end
end
