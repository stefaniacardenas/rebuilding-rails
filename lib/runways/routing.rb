module Runways

	class Application
		
		def get_controller_and_action(env)
			# "_" means "something I'm ignoring, I don't want"
			# Basically we are assigning an empty string to whatever there is before the first slash of our URL
			# cont is the controller 
			# Assign the whatsever after the first url slash to the controller and so on
			_,cont, action, after =
				# Split the URL every time you find the slash
				# Split no more than 4 times
				env["PATH_INFO"].split('/', 4)

			cont = cont.capitalize
			cont += "Controller"

			# const_get is a ruby method.
			# It means look up at any name starting with a capital letter (ie our controller class)
			[Object.const_get(cont), action]
		end

	end
end