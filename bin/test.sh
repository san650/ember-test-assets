#!/usr/bin/env bash

echo 'Test build'

rm -rf ./tests/assets

printf ' * Build without ./tests/assets folder '

ember build --environment test --output-path ./tmp/build-test &> log-test.txt
if [ ! -e ./tmp/build-test/index*.html ]; then
  echo ' FAILED'
  echo '---------'
  cat log-test.txt

  exit 1
else
  echo 'OK'
fi

mkdir -p ./tests/assets
touch ./tests/assets/foo.png

printf ' * Test production build '

ember build -prod --output-path ./tmp/build-production &> log-production.txt
if [ -e ./tmp/build-production/foo*.png ]; then
  echo ' FAILED'
  echo '---------'
  cat log-production.txt

  exit 1
else
  echo 'OK'
fi

printf ' * Test development build '

ember build -dev --output-path ./tmp/build-development &> log-development.txt
if [ ! -e ./tmp/build-development/foo*.png ]; then
  echo ' ! development build failed.'
  echo '---------'
  cat log-development.txt

  exit 1
else
  echo 'OK'
fi
