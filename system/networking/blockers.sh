#!/usr/bin/env bash

websites=("www.reddit.com" "reddit.com" "www.youtube.com" "youtube.com" "www.instagram.com" "instagram.com" "www.facebook.com" "facebook.com" "www.craigslist.org" "craigslist.org" "www.ebay.com" "ebay.com" "www.monkeytype.com" "monkeytype.com" "www.typeracer.com" "typeracer.com" "www.twitter.com" "twitter.com" "www.linkedin.com" "linkedin.com" "tinder.com")

for website in ${websites[@]}; do
    grep -v "$website" /etc/hosts > "$tempHosts"
    mv "$tempHosts" /etc/hosts
done
