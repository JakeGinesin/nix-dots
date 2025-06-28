#!/usr/bin/env bash

blacklist=(
"NUWave"
)

should_block=false
for ssid in "${blacklist[@]}"; do
  if [[ "$CONNECTION_ID" == "$ssid" ]]; then
    should_block=true
    break
  fi
done

$should_block || exit 0 

websites=("www.reddit.com" "www.youtube.com" "www.instagram.com" "www.facebook.com" "facebook.com" "www.craigslist.org" "www.ebay.com" "www.monkeytype.com" "www.typeracer.com" "www.twitter.com" "www.linkedin.com")

op=""
if [ "$2" == "up" ]; then
  op="on"
elif ["$2" == "pre-down" ]; then
  op="off"
else
  exit 1;
fi

for website in ${websites[@]}; do
    sh /etc/profiles/per-user/synchronous/bin/dnsblock-norestart "$op" "$website"
    # grep -v "$website" /etc/hosts > "$tempHosts"
    # mv "$tempHosts" /etc/hosts
done

sudo systemctl restart dnsmasq
