require "runways/version"

module Runways
  class Application
    def call(env)
      [200,{'Content-Type'=>'text/html'},
        ["Hello from Ruby on Runways!"]]
    end
  end
end
