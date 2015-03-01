require 'barge'

class Droplet
  def initialize opts
    @opts = opts
    @droplet = barge.droplet.create({
      "name" => "digitel-tunnel-#{Time.now.to_i}",
      "region" => "nyc3",
      "size" => "512mb",
      "image" => "ubuntu-14-04-x64",
      "ssh_keys" => @opts[:ssh_key_ids],
      "backups" => false,
      "ipv6" => true,
      "user_data" => nil,
      "private_networking" => nil
    })["droplet"]
  end

  def ip_address
    info.networks.v4[0].ip_address
  end

  def info
    barge.droplet.show(@droplet.id).droplet
  end

  def destroy
    print "Attempting to destroy droplet, this might take a few moments..."

    loop do
      response = barge.droplet.destroy(@droplet.id)
      print "."

      break unless response.id == "unprocessable_entity"
      sleep 1
    end
  end

  private

  def barge
    @barge ||= Barge::Client.new(access_token: @opts[:access_token])
  end
end
