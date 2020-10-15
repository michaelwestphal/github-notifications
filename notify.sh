#!/bin/bash

# TODO: Check for gh cli installed and error out if not
# TODO: Ditto ditto terminal-notififier

# TODO: Provide default time arg value

# TODO: Show repo in the message too.
# TODO:
#  It would be cool if we could interogate the notification and if a PR, open a terminal
#  window and use the gh CLI to show the PR

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
