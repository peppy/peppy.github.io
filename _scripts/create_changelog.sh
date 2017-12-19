#!/usr/bin/env zsh

source ~/.zshrc # contains github token
github_changelog_generator="/Users/dean/.rbenv/shims/github_changelog_generator"

dir=$(date +'_posts/%Y/%m/')
filename=$(date +'%Y-%m-%d')
title_date=$(date +'%Y%m%d')

output_file="$dir$filename-dev-changelog-$title_date.md"

generate()
{
    $github_changelog_generator -o $1.md --unreleased-only --max-issues 0 --no-issues --no-compare-link --release-branch master --simple-list https://github.com/ppy/$1
    gtail -n +4 $1.md | ghead -n -4 > $1_trimmed.md
    
    if [ -s $1_trimmed.md ]; then 
        echo -e "\n## [$1](https://github.com/ppy/$1) *$2*" >> $output_file
        cat $1_trimmed.md >> $output_file
    fi
    
    rm $1.md
    rm $1_trimmed.md
}

content="---
title: dev changelog $title_date
---

Hi guys. Back at you with updates since the last post, split into respective projects:"

if [ ! -d $dir ]; then
    mkdir $dir
fi

echo "$content" > $output_file

generate 'osu'           "The osu!lazer project. The future of the osu! client. Download preview releases from [here](https://github.com/ppy/osu/releases) and follow along!"
generate 'osu-framework' "The game framework behind osu!lazer. Written from scratch with osu! in mind, but very extensible."
generate 'osu-web'       "The new web front-end. [Already live](https://osu.ppy.sh/home) but hasn't yet replaced the old site, pending feature parity."

code-insiders $output_file