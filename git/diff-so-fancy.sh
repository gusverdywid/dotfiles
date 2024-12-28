#!/usr/bin/env bash

# Better looking git diff
brew install 'diff-so-fancy'
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Should the first block of an empty line be colored
git config --bool --global diff-so-fancy.markEmptyLines true
# Simplify git header chunks to a more human readable format
git config --bool --global diff-so-fancy.changeHunkIndicators true
# Should the pesky + or - at line-start be removed
git config --bool --global diff-so-fancy.stripLeadingSymbols true
# By default, the separator for the file header spans the full width of the
# terminal. Use this setting to set the width of the file header manually
git config --global diff-so-fancy.rulerWidth 80
