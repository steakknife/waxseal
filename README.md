# waxseal

![seal](http://www.maleschek.com/assets/images/initialen-siegel.jpg)

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
