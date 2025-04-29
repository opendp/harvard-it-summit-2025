# harvard-it-summit-2025
Slides for June 2025 talk on OpenDP and DP Wizard

Managing this in github so that:
- I can use doctest to confirm that all the examples work. 
- I don't waste time tweaking the page layout.
- We can use the normal PR review process.

## Setup

```
brew install pandoc
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
./render.sh
```

For now, to keep it simple, run `render.sh` by hand and check in the output `index.html`.