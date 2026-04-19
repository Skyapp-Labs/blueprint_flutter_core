#!/bin/bash

VERSION=$1

echo "Releasing v$VERSION..."

# update version manually or via script
git add .
git commit -m "release: v$VERSION"

git tag v$VERSION
git push origin main --tags