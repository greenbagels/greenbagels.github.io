#! /usr/bin/env bash

# Special thanks to http://pauldambra.github.io for some (a lot) of structure

set -e

REPO_URL="https://${OATH_TOKEN}@github.com/greenbagels/greenbagels.github.io"

function main {
    clean
    fetch
    build
    deploy
}

function clean {
    echo "Cleaning old _site..."
    if [ -d "_site" ]; then
        rm -r _site
    fi
}

function fetch {
    echo "Fetching child site repo..."
    git clone --depth 1 ${REPO_URL} _site
}

function build {
    echo "Building the site..."
    bundle exec jekyll build --force
    cp -f .travis.yml _site # we don't want to trigger another build
    rm -f _site/deploy.sh # we don't want to host executable scripts...
}

function deploy {
    if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
        echo "Pull request, not deploying!"
        exit 0
    fi
    git config --global user.name "Travis CI"
    git config --global user.email "travis@travis-ci.org"
    echo "Deploying site..."
    cd _site
    git checkout master # just in case
    git add -A
    git status
    git commit -m "Deploy Travis build ${TRAVIS_BUILD_NUMBER}"
    git push ${REPO_URL} master:master
}

main
