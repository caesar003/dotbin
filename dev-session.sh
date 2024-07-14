#!/bin/bash

# Define the session directory
SESSION_DIR=~/.config/kitty/sessions

# Create the config directory if it doesn't exist
mkdir -p $SESSION_DIR

# Function to save the kitty state
save_state() {
  local session_name="${1:-kitty_state}"
  local state_file="$SESSION_DIR/${session_name}.json"

  kitty @ ls | jq '[.[0].tabs[] | {title: .title, cwd: .windows[0].cwd}]' > "$state_file"
  echo "Kitty state saved to $state_file"
}

# Function to restore the kitty state
restore_state() {
  local session_name="${1:-kitty_state}"
  local state_file="$SESSION_DIR/${session_name}.json"

  if [ ! -f "$state_file" ]; then
    echo "No state file found at $state_file"
    exit 1
  fi

  state=$(cat "$state_file")
  num_tabs=$(echo "$state" | jq '. | length')

  for ((i=0; i<$num_tabs; i++)); do
    cwd=$(echo "$state" | jq -r ".[$i].cwd")
    title=$(echo "$state" | jq -r ".[$i].title")
    if [ $i -eq 0 ]; then
      kitty @ set-tab-title "$title"
      cd "$cwd"
    else
      kitty @ launch --type=tab --tab-title="$title" --cwd="$cwd"
    fi
  done

  echo "Kitty state restored from $state_file"
}

# Check the parameter and call the appropriate function
case "$1" in
  save)
    save_state "$2"
    ;;
  restore)
    restore_state "$2"
    ;;
  *)
    echo "Usage: $0 {save|restore} [name]"
    exit 1
    ;;
esac
