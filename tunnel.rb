require './droplet'

class Tunnel
  def initialize opts
    @droplet = Droplet.new opts
  end

  def start
    wait_until_active do
      turn_on_proxy
      system "ssh -C2qTnN -D 8080 -p 22 root@#{@droplet.ip_address}"
    end
  end

  def stop
    turn_off_proxy
    @droplet.destroy
  end

  private

  def wait_until_active
    loop do
      sleep 1
      break if @droplet.info.networks != nil
    end

    yield
  end

  def turn_on_proxy
    system "networksetup -setsocksfirewallproxy Wi-Fi localhost 8080"
    system "networksetup -setsocksfirewallproxystate Wi-Fi on"
  end

  def turn_off_proxy
    system "networksetup -setsocksfirewallproxystate Wi-Fi off"
  end
end