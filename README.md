# waxseal

![seal](http://www.maleschek.com/assets/images/initialen-siegel.jpg)

## What it does

Signs the ruby gems you created

## Huh?

RubyGems are unsigned by default, and the built-in security policy is awful, which means gems and their dependencies are not currently checked.  So better pray that gems are being downloaded over https:// at least.

### What it does 

- Sets up your self-signed cert, if missing (which you need to put the public cert somewhere securely, like with your GPG fingerprint)
- Signs the gem (gemspec) in the current directly
- Creates a new git commit, if you want it to

You could do all this yourself, like anything, but this makes it much more convienent.  It will support modifying gemspecs until Ruby 1.9 is retired completely (Feburary 2015), because 2+ automatically signs gems now, even though RubyGems.org and gem policy are still insecure by default.

## What you can do

The best move for the communinity would be to encourage the requirement of RubyGems reject new gems that do not verify and to set security policy to at least `MediumSecurity` and then `HighSecurity`.  This means it's important to get all gems signed, even ones that are "abandoned."

Until then, there won't be enough political capital to convince the "there's no problem" pepole to change until there's another avoidable major security gaffe, like hacked gems running some malicious code on someone's app servers.

The other thing you can do to deter malicious code getting to production is run a *private* gem repo that compares hashes of gems downloaded via multiple links.  This won't prevent an attack of malicious code of hacking RubyGems between developer upload channel, storage on their disks and user download channel, which only end-to-end cryptographic signatures provides.

## What else you can do to increase security (and cause more things to fix)

### Configure rubygems (`gem`)

Add this to your `/etc/gemrc` or `~/.gemrc`:

```yaml
---
gem: -P MediumSecurity # append this if gem: already exists
```

### Configure bundler

[It's not currently possible](https://github.com/bundler/bundler/issues/2350) to persist security policy with bundler.

It's possible to pass the security policy to bundler via `bundler ... --trust-policy {{Level}}Policy`


## Read more
[http://guides.rubygems.org/security/](http://guides.rubygems.org/security/)

[https://www.ruby-doc.org/stdlib-2.2.0/libdoc/rubygems/rdoc/Gem/Security.html](https://www.ruby-doc.org/stdlib-2.2.0/libdoc/rubygems/rdoc/Gem/Security.html)



## Install

    [sudo] gem cert --add <(curl -L https://gist.github.com/steakknife/5333881/raw/gem-public_cert.pem) # adds my cert (do once)
    [sudo] gem install waxseal -P HighSecurity

## Usage

    Usage: waxseal [options]
        -c, --commit                     Make a new git commit automatically. Can also be set by WAXSEAL_AUTO_COMMIT=1
        -d, --dont-sign-commit           Don't GPG sign Git commits. Can also be set by WAXSEAL_DONT_SIGN_AUTO_COMMIT=1
        -e, --email EMAIL                Email address to use for signing, overrides optional variable WAXSEAL_GEM_SIGNING_EMAIL
        -f, --force                      No prompts.  Can also be set by WAXSEAL_NO_CONFIRM=1
        -h, --help

## License

MIT

(Try not to get wax all over the place, it's hard to clean up.)
