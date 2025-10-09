# find /home/synchronous/current-semester -follow -maxdepth 1 | cut -c36- | sed '/^[[:space:]]*$/d' | rofi -dmenu | read rsem; yq ".url" "/home/synchronous/current-semester/$rsem/info.yaml" | xargs firefox
rsem=$(find /home/synchronous/current-semester -follow -maxdepth 1 | cut -c36- | sed '/^[[:space:]]*$/d' | rofi -dmenu)
yq ".url" "/home/synchronous/current-semester/$rsem/info.yaml" | xargs firefox
