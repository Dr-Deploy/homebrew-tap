# Dr.Deploy Homebrew tap

Homebrew formulae for [Dr.Deploy](https://drdeploy.dev) — a live monitor for shipped websites.

## Install

```bash
brew install dr-deploy/tap/drdeploy
```

That's it. Brew picks the right macOS or Linux binary for your platform from [the latest GitHub Release](https://github.com/Dr-Deploy/drdeploy/releases).

## Usage

```bash
drdeploy login            # OAuth device flow → save token at ~/.config/drdeploy/token
drdeploy add example.com  # register a site
drdeploy scan example.com # trigger a scan
```

Full docs: https://drdeploy.dev/docs

## Upgrade

```bash
brew update && brew upgrade drdeploy
```

## Uninstall

```bash
brew uninstall drdeploy
brew untap drdeploy/tap
```

## Other install paths

- Universal: `curl -fsSL https://drdeploy.dev/install | sh`
- npm: `npm install -g @drdeploy/cli`
- AI-editor skill: `npx @drdeploy/skills setup`
- Direct binary download: https://github.com/Dr-Deploy/drdeploy/releases/latest

## Source

The CLI itself is open source at https://github.com/Dr-Deploy/drdeploy. This repo just hosts the brew formula.

## Updating the formula

For now, manual:

```bash
# In Dr-Deploy/drdeploy after a release ships, grab the new SHA256s:
for arch in darwin-arm64 darwin-x64 linux-arm64 linux-x64; do
  echo "${arch}: $(curl -fsSL https://github.com/Dr-Deploy/drdeploy/releases/download/@drdeploy/cli@VERSION/drdeploy-${arch} | shasum -a 256 | awk '{print $1}')"
done

# Update Formula/drdeploy.rb with the new version + SHAs, commit, push.
```

Auto-bump via GitHub Actions on release lands in v0.2.

## License

The formula itself: MIT. The drdeploy CLI: MIT.
