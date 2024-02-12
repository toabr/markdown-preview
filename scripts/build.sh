#!/bin/bash
# https://www.leonscherer.com/blog/push-folder-to-separate-git-branch
# git worktree add dist gh-pages --no-checkout

# remove worktree for it to be added again
git worktree remove dist

# add worktree again, creating the .git file
git worktree add dist gh-pages --no-checkout

# save .git file from being deleted by the generator
cp dist/.git ~.git.tmp

# generate website here
yarn run build

# restore .git worktree marker file
mv ~.git.tmp dist/.git

# make /dist/_astro work with github pages
touch dist/.nojekyll

# now cd into ./dist commit and puch
