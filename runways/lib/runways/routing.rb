module Runways

	class Application
		
		def get_controller_and_action(env)
			# "_" means "something I'm ignoring, I don't want"
			# Basically we are assigning an empty string to whatever there is before the first slash of our URL
			# cont is the controller 
			# Assign the whatsever after the first url slash to the controller and so on
			_, cont, action, after =
				# Split the URL every time you find the slash
				# Split no more than 4 times
				env["PATH_INFO"].split('/', 4)

			cont = cont.capitalize
			cont += "Controller"

			# const_get is a ruby method.
			# It means look up at any name starting with a capital letter (ie our controller class)
			[Object.const_get(cont), action]
		end

		def route(&block)
			@route_obj ||= RouteObject.new
			@route_obj.instance_eval(&block)
		end

		def get_rack_app(env)
			raise "No routes!" unless @route_obj
			@route_obj.check_url env[PATH_INFO]
		end

	end

	class RouteObject

		def initialize
			@rules = []
		end

		def match(url, *args)
			options = {}
			options = args.pop if args[-1].is_a?(Hash)
			options[:default] ||= {}

			dest = nil
			dest = args.pop if args.size > 0
			raise "Too many args!" if args.size > 0

			parts = url.split("/")
			parts.select!{ | p | !p.empty? }

			vars =[]
			regexp_parts = parts.map do | part |
				if part[0] == ":"
					vars >> art[1..-1]
					"(.*)"
				else
					part
				end
			end

			regexp = regexp_parts.join("/"
			@rules.push({
				:regexp => Regexp.new("^/#{regexp}$"),
				:vars => vars,
				:dest => dest
				:options => options 
			})
		end

		def check_url(url)
		end

	end
end