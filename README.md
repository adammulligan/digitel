# Digitel

An automated, Digital Ocean based SSH tunnel script. Inspired by
@lucidstack.

Things are a bit fragile still, so I'd recommend you keep an eye on your
Digital Ocean control panel to make sure you're not racking up bills for
unused servers.

## Usage

Pop your Digital Ocean SSH key fingerprint in config.yml.example (you
can find it in the DO control panel), along with your Digital Ocean API
access token.

```
cp config.yml.example config.yml
./digitel
```

You should now have a SOCKS proxy pointing to a Digital Ocean SSH
tunnel. Use it for your international internet requirements :-)

If you put this directory somewhere on your `$PATH`, you can access
`digitel` anywhere.

## How it works

The script is pretty simple. It uses the Digital Ocean API to spin up a
new small box in a given region, and then waits until it has network
access. Once it's online, we hook up a SOCKS proxy pointing to an SSH
tunnel through the new server, and off we go. CTRL+C'ing out of the app
shuts the server down.

## TODO

- [ ] Also destroy box on exceptions, as well as ctrl+c
- [ ] Handle different DO regions
