if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  echo "Example: $0 example.com"
  exit 1
fi

[ -f /tmp/domains ] && rm /tmp/domains
[ -f /tmp/subs ] && rm /tmp/subs
[ -f /tmp/jsonl ] && rm /tmp/jsonl
touch /tmp/domains
touch /tmp/subs
touch /tmp/jsonl
domain=$1
amass enum -d "$1" 2>&1 | tee /tmp/domains
cat /tmp/domains | grep '(FQDN)' | sed -E 's/\s*\(FQDN\).*//g' | grep "\.$1" | sort -u 2>&1 | tee /tmp/subs
httpx -l /tmp/subs -sc -cl -ct -title -server -ip -asn -cdn -jarm -favicon -wc -lc -rt -td -extract-fqdn -json -silent -ob -irh=false -irr=false -include-chain=false > /tmp/jsonl
cat /tmp/jsonl | jq  -r '{input, title, url, port, timestamp, scheme, webserver, content_type, host, method, path, favicon_url, time, a, aaaa, tech: (.tech | join(", ")), words, lines, status_code, content_length, resolvers, body_fqdn: (.body_fqdn | join(", "))}' 
rm /tmp/domains
rm /tmp/subs
rm /tmp/jsonl
