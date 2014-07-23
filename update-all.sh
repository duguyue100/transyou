#!/bin/sh

now="$(date): update all"

git add -A README.md
git add -A update-all.sh
git add -A matlab/*
git add -A resources/*.mat
git add -A resources/*.jpg
git add -A resources/*.jpeg
git add -A resources/*.png

git commit -m "$now"

git push origin master
