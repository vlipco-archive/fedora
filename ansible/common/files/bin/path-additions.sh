#!/usr/bin/bash
export PATH="bin:/srv/bin:/usr/local/bin:$PATH"
alias sudo='sudo env PATH=$PATH'

# sudo systemctl
alias sctl='sudo systemctl'
# journal tail
alias jctl='journalctl -a -f -u'
# crazy watch
alias cw='watch -n 0.5'