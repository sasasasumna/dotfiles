#!/bin/bash

echo "machine github.com login sasasasumna password $GITHUB_TOKEN" > ~/.netrc
chmod 0600 ~/.netrc
