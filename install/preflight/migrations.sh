POLARCHY_MIGRATIONS_STATE_PATH=~/.local/state/polarchy/migrations
mkdir -p $POLARCHY_MIGRATIONS_STATE_PATH

for file in ~/.local/share/polarchy/migrations/*.sh; do
  touch "$POLARCHY_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
