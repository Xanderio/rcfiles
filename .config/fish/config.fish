# setup paths
if status --is-login
  source /usr/home/asieg/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
  set -x PATH /usr/home/asieg/Local/bin /usr/home/asieg/.local/bin $PATH
  #  set -x MANPATH /usr/home/asieg/Local/man $MANPATH
  set -x PYTHONPATH /usr/home/asieg/.local/lib/python3.6/site-packages /usr/home/asieg/Local/python/lib/python2.7/site-packages /usr/home/asieg/Local/z3/lib/python2.7/dist-packages $PYTHONPATH
  set -x __fish_bin_dir /usr/home/asieg/Local/fish/bin
  source ~/.config/fish/ssh_agent_start.fish
  start_agent
end

# this function may be required
function fish_title
  true
end

function fish_greeting
end

set -x PATH ~/.cargo/bin $PATH
set -x EDITOR /usr/home/asieg/Local/nvim/bin/nvim
set -x MANPAGER "nvim -c 'set ft=man' -"
set -x BROWSER (which firefox)
set -x PAGER "less"
set -x LESS "-qR"
set -g fish_term24bit 1

alias vi nvim
alias vim nvim
