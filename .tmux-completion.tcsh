#   Source this script in tcsh to setup shell completions
#   for tmux.  Completions are activated by typing <tab> or Control-D
#   in the shell after entering a partial command.
#
# Usage:
#   source tmux-completion.tcsh     (e.g. in ~/.cshrc)
#
# Supported completions:
#   tmux <tab>            (lists tmux commands)
#   tmux *session -t <tab>     (lists tmux sessions)
#   tmux *pane    -t <tab>     (lists tmux panes)
#
# Author: Peter Debacker

if ( `where tmux` != "" ) then
    # tmux is installed so define tcsh completions for it.

    # List of known tmux subcommands
    # This is a hard-coded list to avoid calling 'tmux list-commands' at startup.
    set __tmux_cmd_names = (attach-session bind-key break-pane capture-pane clear-history \
                            clock-mode command-prompt confirm-before copy-mode \
                            delete-buffer detach-client display-message display-panes \
                            has-session if-shell join-pane kill-pane kill-server \
                            kill-session kill-window last-pane last-window link-window \
                            list-buffers list-clients list-commands list-keys list-panes \
                            list-sessions list-windows load-buffer lock-client lock-server \
                            lock-session move-window new-session new-window next-layout \
                            next-window paste-buffer pipe-pane previous-layout previous-window \
                            refresh-client rename-session rename-window resize-pane \
                            respawn-pane respawn-window rotate-window run-shell save-buffer \
                            select-layout select-pane select-window send-keys send-prefix \
                            server-info set-buffer set-environment set-option set-window-option \
                            show-buffer show-environment show-messages show-options \
                            show-window-options source-file split-window start-server \
                            suspend-client swap-pane swap-window switch-client unbind-key \
                            unlink-window)

    alias __tmux_sessions 'tmux list-sessions | cut -d : -f 1'
    alias __tmux_windows  'tmux list-windows  | cut -d " " -f 1-2 | sed -e "s/://"'
    alias __tmux_panes    'tmux list-panes    | cut -d : -f 1'
    alias __tmux_clients  'tmux list-clients  | cut -d " " -f 1-2 | sed -e "s/://"'

    # Define the completions (see the tcsh man page).
    complete tmux \
             'p/1/$__tmux_cmd_names/' \
             'n/*-session/(-t)/' \
             'n/*-window/(-t)/' \
             'n/*-pane/(-t)/' \
             'n/*-client/(-t)/' \
             'N/*-session/`__tmux_sessions`/' \
             'N/*-window/`__tmux_windows`/' \
             'N/*-pane/`__tmux_panes`/' \
             'N/*-client/`__tmux_clients`/' \
             'n/-t/`__tmux_clients; __tmux_panes; __tmux_windows; __tmux_sessions`/'
endif

