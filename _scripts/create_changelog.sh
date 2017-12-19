#!/usr/bin/env zsh

source ~/.zshrc # contains github token

github_changelog_generator="/Users/dean/.rbenv/shims/github_changelog_generator"

dir=$(date +'_posts/%Y/%m/')
filename=$(date +'%Y-%m-%d')
title_date=$(date +'%Y%m%d')

output_file="$dir$filename-dev-changelog-$title_date.md"

content="---
title: dev changelog $title_date
---

Hi guys. Back at you with updates since the last post, split into respective projects:"

if [ ! -d $dir ]; then
    mkdir $dir
fi

echo "$content" > $output_file

for f in _scripts/projects/*.txt
do
    name=$(sed -n 1p $f)
    repo_path=$(sed -n 2p $f)
    description=$(sed -n 3p $f)

    echo "Running for project $name"
    
    last_tag=$(cd $repo_path; git fetch -t upstream; git tag | grep changelog | tail -1)

    echo "Last tag: $last_tag"

    $github_changelog_generator -o $name.md --since-tag "$last_tag" --exclude-tags-regex "^((?!changelog).)*$" --max-issues 0 --no-issues --no-compare-link --release-branch master --simple-list https://github.com/ppy/$name
    gtail -n +4 $name.md | ghead -n -4 > $name_trimmed.md
    
    if [ -s $name_trimmed.md ]; then 
        echo -e "\n## [$name](https://github.com/ppy/$name) *$description*\n\n### Important Changes\n\n### Other changes" >> $output_file
        cat $name_trimmed.md >> $output_file

        tag_name=$(date +'changelog-%Y%m%d')
        (cd $repo_path; git stash; git reset --hard upstream/master; git tag $tag_name; git push upstream $tag_name)
    fi
    
    rm $name.md
    rm $name_trimmed.md
done

code-insiders $output_file