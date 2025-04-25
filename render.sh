#!/bin/bash

set -euo pipefail

# Check the math!
python3 -m doctest slides.md

# Slidy worked out of the box; others might be better!
pandoc -t slidy \
  -s slides.md \
  -o slides.html \
  --embed-resources --standalone \
&& open slides.html