require './tunnel'
require 'yaml'

opts = YAML.load_file('./config.yml')
tunnel = Tunnel.new(opts)

trap("INT") { tunnel.stop; exit }

puts "Connecting to tunnel"
tunnel.start
