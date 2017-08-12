#! /usr/bin/env bash

# Special thanks to http://pauldambra.github.io for some (a lot) of structure

set -e

REPO_URL="https://${OATH_TOKEN}@github.com/greenbagels/greenbagels.github.io"

function main {
    clean # avoid using the force flag
    build
    deploy
}

function clean {
    git config --replace-all remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
    git fetch
    git checkout master
    [[ -d "_site" ]] && rm -r _site
    git checkout source
}

function build {
    bundle exec jekyll build
}

function deploy {
    if [[ "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
        echo "Pull request, not deploying!"
        exit 0
    fi
    git config --global user.name "Travis CI"
    git config --global user.email "travis@travis-ci.org"
    git checkout master
    git add _site/\*
    git commit -m "Deploy Travis build ${TRAVIS_BUILD_NUMBER}"
    git push ${REPO_URL} master:master
}

main
