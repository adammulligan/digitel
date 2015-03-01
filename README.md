# Digitel

An automated, Digital Ocean based SSH tunnel script. Inspired by
@lucidstack.

## Usage

Pop your Digital Ocean SSH key fingerprint in main.rb (you can find it
in the DO control panel), along with your Digital Ocean API access
token.

```
ruby main.rb
```

You should now have a SOCKS proxy pointing to a Digital Ocean SSH
tunnel. Use it for your international internet requirements :-)

## How it works

The script is pretty simple. It uses the Digital Ocean API to spin up a
new small box in a given region, and then waits until it has network
access. Once it's online, we hook up a SOCKS proxy pointing to an SSH
tunnel through the new server, and off we go. CTRL+C'ing out of the app
shuts the server down.

## TODO

- [ ] Automatically get current network service type (Wi-Fi or Ethernet)
- [ ] Box deletion doesn't seem to work reliably
- [ ] Also destroy box on exceptions, as well as ctrl+c
- [ ] Handle different DO regions
