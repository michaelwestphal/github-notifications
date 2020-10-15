# github-notifications

MacOS notifications from GitHub

## Installation

1. Clone this repo
1. Install dependencies `brew install jq terminal-notifier gh`
1. Setup the [GitHub CLI](https://cli.github.com/manual/).
1. Call the script with the number of minutes between notifications, e.g. `./notify.sh 10` for 10 minute intervals
1. Click on the notification to open your GitHub notifications page

### Notes

- Choose Banner (temporary) or Alert (persistent) in System Preferences > Notifications > terminal-notifier
- Mark notifications as Read to stop them
- Add a sound https://github.com/julienXX/terminal-notifier
- Try a more advanced notifier https://github.com/dschep/ntfy
