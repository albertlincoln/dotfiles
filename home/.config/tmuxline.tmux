set -g status-justify "left"
set -g status "on"

set -g status-style dim

set -g status-left-length "100"
set -g status-bg "colour235"
set -g status-right-length "100"
setw -g window-status-separator ""
set -g status-left "#[fg=colour235,bg=colour245] #S #[fg=colour245,bg=colour235,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour238] #(nowplaying claytron)  %Y-%m-%d %H:%M #[fg=colour245,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour245] #h "
setw -g window-status-format "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #I#F  #W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour235,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour238] #I#F  #W #[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]"
