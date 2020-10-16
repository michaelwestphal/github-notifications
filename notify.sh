#!/bin/bash

# Only run one instance...
if [[ "`pgrep -f $(basename $0)`" ]]; then
	exit
fi

echo "github notifications started"

while true
do
  gh api notifications \
    | jq -r '.[] | select(.unread) | [.subject.type, .reason, .subject.title] | @sh' \
    | xargs -n 3 sh -c \
    'terminal-notifier -title "GitHub Notification" -subtitle "$0 $1" -message "$2" -open "https://github.com/notifications"'
  sleep $(($1 * 60))
done
