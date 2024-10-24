#/bin/bash

cd ~/activation_api/api_repo/
tmux new-session -s work -n api -d 'fish -C nvim'

tmux new-window -c ~/activation_api/ui_repo/ -n ui -t work:1 'fish -C nvim'

tmux new-window -c ~/activation_api/infra_repo/ -n infra -t work:2 'fish -C nvim'
tmux new-window -c ~/activation_api/infra_repo/ -n infra-terminal -t work:3 'fish'

tmux new-window -c ~/ -n misc -t work:4 'fish'

tmux select-window -t work:0
tmux attach-session -t work
