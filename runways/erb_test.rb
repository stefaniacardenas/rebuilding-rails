require "erubis"

template = <<TEMPLATE

HELLO! This is a template
It has <%= whatever %>
TEMPLATE

eruby = Erubis::Eruby.new(template)
# The .src says give me the code for this template
puts eruby.src
puts "============="
puts eruby.result(:whatever => "ponies!")