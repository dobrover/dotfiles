set -g prefix C-a
bind C-a send-prefix
set -g default-terminal "screen-256color"

set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
bind -t vi-copy y copy-pipe "xclip -sel clip -i"

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Allows for faster key repetition
set -s escape-time 0
set -g base-index 1
set -g set-clipboard off
setw -g monitor-activity on

bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."

# Toggle mouse on with ^B m
bind m \
  set -g mode-mouse on \;\
  set -g mouse-resize-pane on \;\
  set -g mouse-select-pane on \;\
  set -g mouse-select-window on \;\
  display 'Mouse: ON'

# Toggle mouse off with ^B M
bind M \
  set -g mode-mouse off \;\
  set -g mouse-resize-pane off \;\
  set -g mouse-select-pane off \;\
  set -g mouse-select-window off \;\
  display 'Mouse: OFF'
