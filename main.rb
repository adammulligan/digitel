require './tunnel'

opts = {
  access_token: 'digital ocean api token',
  ssh_key_id: "ssh key fingerprint goes here"
}

tunnel = Tunnel.new(opts)

trap("INT") { tunnel.stop; exit }

puts "Connecting to tunnel"
tunnel.start
