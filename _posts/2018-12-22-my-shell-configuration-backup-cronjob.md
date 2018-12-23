---
layout: post
title: My cronjob backup system for my bash configuration files
date: 2018-12-22
tags: [bash, shell]
ads: true
permalink: /cronjob-backups-for-bash-configs/
---
I use three files to configure my bash shell: `.bash_profile`, `.bashrc`, and `.bash_alias`. I occasionally change these files but rarely remember to record the changes in [my backup gist](https://gist.github.com/benwiz/69270080eeeec2214e74369c32aaed7a). So I decided to make a cronjob that would automatically back up these three files.

## First, the backup script

The following script does three things:

1. Copies the actual `.bash_profile`, `.bashrc`, and `.bash_alias` files to a GitHub gist repo
2. Commits and pushes the changes to GitHub
3. Displays a native Apple notification that the process was run

<script src="https://gist.github.com/benwiz/872178b2a09c520d4d7eb1b6a659f1a1.js"></script>

## Second, the cronfile

The script must be executed automatically. Ideally I would run the script on boot, but I didn't want to make the effort for the script to wait until an internet connection was formed. My solution was to push changes to GitHub three times a day. When I worked more consistent hours, I only pushed changes once a week when I knew I would be coding at work.

<script src="https://gist.github.com/benwiz/5b834e4a6762125e8c227e37a764bf38.js"></script>
