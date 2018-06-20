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

unbind p
bind p previous-window

# shorten command delay
set -sg escape-time 1

# don't rename windows automatically
set-option -g allow-rename off

# mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# enable vi mode keys
set-window-option -g mode-keys vi

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
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-k if-shell "$is_vim" "send-keys C-w 'k'" "display-panes ; select-pane -U"
bind-key -n C-j if-shell "$is_vim" "send-keys C-w 'j'" "display-panes ; select-pane -D"
bind-key -n C-h if-shell "$is_vim" "send-keys C-w 'h'" "display-panes ; select-pane -L"
bind-key -n C-l if-shell "$is_vim" "send-keys C-w 'l'" "display-panes ; select-pane -R"

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
set -g status-position top
set -g status-justify left
# set -g status-bg colour18
# set -g status-fg colour137
# set -g status-attr dim
# set -g status-left ''
# set -g status-right '#[fg=colour233,bg=colour19,bold] %d/%m #[fg=colour233,bg=colour8,bold] %H:%M:%S '
# set -g status-right-length 50
# set -g status-left-length 20

# messages
set -g message-attr bold

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'sei40kr/tmux-airline-dracula'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
