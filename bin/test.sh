#!/usr/bin/env bash

TOTAL_TESTS=3
STATUS_EXIT=0

function tap_ok()
{
  echo "ok $1"
}

function tap_not_ok()
{
  echo "not ok $1"
  # print diagnostics
  sed 's/^/# /' "$2"

  STATUS_EXIT=1
}

function setup()
{
  rm -rf ./tests/assets
}

function teardown()
{
  exit $STATUS_EXIT
}

setup

echo "1..${TOTAL_TESTS}"

# 1. -------

TEST='build without ./tests/assets folder'

ember build --environment test --output-path ./tmp/build-test &> log-test.txt

if [ ! -e ./tmp/build-test/index*.html ]; then
  tap_not_ok "$TEST" "log-test.txt"
else
  tap_ok "$TEST"
fi

# 2. -------

TEST='test production build'

mkdir -p ./tests/assets
touch ./tests/assets/foo.png

ember build -prod --output-path ./tmp/build-production &> log-production.txt

if [ -e ./tmp/build-production/foo*.png ]; then
  tap_not_ok "$TEST" "log-production.txt"
else
  tap_ok "$TEST"
fi

# 3. -------

TEST='test development build'

ember build -dev --output-path ./tmp/build-development &> log-development.txt

if [ ! -e ./tmp/build-development/foo*.png ]; then
  tap_not_ok "$TEST" "log-development.txt"
else
  tap_ok "$TEST"
fi

teardown
