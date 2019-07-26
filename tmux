set-option -g default-shell $SHELL

# change the prefix from 'C-b' to 'C-a'
# (remap capslock to CTRL for easy access)
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# start with window 1 (instead of 0)
set -g base-index 1

# start with pane 1
set -g pane-base-index 1

# split panes using | and -, make sure they open in the same path
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

unbind '"'
unbind %

# open new windows in the current path
bind c new-window -c "#{pane_current_path}"

# reload config file
bind r source-file ~/.tmux.conf

# shorten command delay
set -sg escape-time 1

# don't rename windows automatically
set-window-option -g allow-rename off
set-window-option -g automatic-rename off

# mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# set vim-like copy-mode keys
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
unbind-key -T copy-mode-vi v
bind-key -T copy-mode-vi 'v' send -X begin-selection # Begin selection in copy mode.
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle # Begin selection in copy mode.
bind-key -T copy-mode-vi 'y' send -X copy-selection # Yank selection in copy mode.

# set tmux to use vi keys
setw -g mode-keys vi

# setw -g xterm-keys on

# enable clipboard
set-option -s set-clipboard on

# set default terminal mode to 256 colors
set -g default-terminal "screen-256color"

# fix pbcopy/pbpaste
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
set-option -g default-command "reattach-to-user-namespace -l zsh"


# present a menu of URLs to open from the visible pane. sweet.
bind-key u capture-pane \;\
    save-buffer /tmp/tmux-buffer \;\
    split-window -l 10 "urlview /tmp/tmux-buffer"

# skip confirmations
bind-key & kill-window
bind-key x kill-pane

# Navigating vim and tmux splits
# http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

######################
### DESIGN CHANGES ###
######################

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

# statusbar
set-option -g status-position bottom
set-option -g status-fg white
set-option -g status-bg default
set-option -g status-attr default
set-window-option -g window-status-fg "#666666"
set-window-option -g window-status-bg black
set-window-option -g window-status-attr default
set-window-option -g window-status-current-fg red
set-window-option -g window-status-current-bg black
set-window-option -g window-status-current-attr default
set-option -g message-fg white
set-option -g message-bg black
set-option -g message-attr bright
set -g status-position bottom
set -g status-left ""
set -g status-justify left
setw -g window-status-current-format '#W'
setw -g window-status-format         ' #(echo "#{window_name}") '
setw -g window-status-current-format ' #(echo "#{window_name}") '
set -g status-right ' #{?client_prefix,💭#[noreverse] ,}'

# messages
set -g message-attr bold

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
