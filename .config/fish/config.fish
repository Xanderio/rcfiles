source ~/.config/fish/ssh_agent_start.fish
start_agent

# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end

# OPAM configuration
. /home/asieg/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

set -x EDITOR nvim
