# Don't share history between shells
setopt no_share_history

# The vi-mode plugin incurs a large delay deleting when switching to normal mode.
bindkey -v
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

