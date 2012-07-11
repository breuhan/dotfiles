#!/usr/bin/env bash

set -e
[ -n "$DEBUG" ] && set -x

FILESFILE="secret-files.list"
FILES=$(cat $FILESFILE)
SECRETFILE=$(mktemp -t XXXXX)
REPOFILE="secret-files.tar.gz.aes256"

# ------------------------------------------
GITDIFF=$(git diff-files)
if [ ! "$GITDIFF" == "" ]; then
    echo -n "warning: uncommited changes found! proceed in .. 3 "
    sleep 1
    echo -n "2 "
    sleep 1
    echo -n "1 "
    sleep 1
    echo "now!"
fi

# ------------------------------------------
GIT_EMAIL=$(git config --get user.email)
GIT_NAME=$(git config --get user.name)
GIT_OLD_BRANCH=$(git branch | grep '^*' | cut -d' ' -f2)

# ------------------------------------------
TMPFILE=$(mktemp -t XXXXX)
RANDOMFILE="secret-files.random"

dd if=/dev/random of=$RANDOMFILE bs=512 count=10240 2> /dev/null
tar -czf $TMPFILE $FILES $RANDOMFILE $FILESFILE 2> /dev/null
aespipe -T -e aes256 $@ <$TMPFILE >$SECRETFILE

rm -f $TMPFILE $RANDOMFILE

# ------------------------------------------
set +e
git checkout --quiet --orphan secret-files 2> /dev/null; CODE=$?
set -e
if [ ! $CODE -eq 0 ]; then
    git branch -D secret-files > /dev/null
    git checkout --quiet --orphan secret-files
fi
git rm --quiet --force --ignore-unmatch -r .

# ------------------------------------------
cp $SECRETFILE $REPOFILE
git add $REPOFILE
rm -f $SECRETFILE

# ------------------------------------------
git config --local user.email "$GIT_EMAIL"
git config --local user.name "$GIT_NAME"
git commit --quiet --message "Secret file update"
git checkout --quiet $GIT_OLD_BRANCH
