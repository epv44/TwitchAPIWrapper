#!/usr/bin/env bash

PATH=$(bash -l -c 'echo $PATH')

jazzy -x -workspace,Example/TwitchAPIWrapper.xcworkspace,-scheme,TwitchAPIWrapper-Example

#remove old docs
rm -rf ~/Documents/GithubPages/epv44.github.io/docs/TwitchAPIWrapper
#add new docs
mv docs ~/Documents/GithubPages/epv44.github.io/docs/TwitchAPIWrapper 
#push changes to github
git -C ~/Documents/GithubPages/epv44.github.io add .
git -C ~/Documents/GithubPages/epv44.github.io commit -m "Documentation Updates"
git -C ~/Documents/GithubPages/epv44.github.io push
