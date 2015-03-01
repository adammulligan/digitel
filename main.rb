require './tunnel'

opts = {
  access_token: '',
  ssh_key_ids: [""]
}

tunnel = Tunnel.new(opts)

trap("INT") { tunnel.stop; exit }

puts "Connecting to tunnel"
tunnel.start
