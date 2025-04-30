#!/bin/bash

set -euo pipefail

MD=index.md

# Check the math!
python3 -m doctest $MD

# Slidy worked out of the box; others might be better!
pandoc -t slidy \
  --include-before-body=include-before-body.html \
  -s $MD \
  -o index.html \
  --standalone \
&& open index.html