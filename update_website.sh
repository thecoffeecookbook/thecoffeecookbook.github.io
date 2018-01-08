#!/bin/sh
./build.sh
git add -A
git commit -m "Update on the website at $(date)"
git push
git subtree push --prefix static origin deploy