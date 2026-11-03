# Omniboost Tap

Homebrew formulae from [Omniboost](https://github.com/omniboost).

## Tempo Tracker

[Tempo Tracker](https://github.com/omniboost/tempo-tracker) is a macOS menu bar app that tracks your time per Jira ticket and sends it to Tempo after you check the day.

```bash
brew tap omniboost/tap
brew install tempo-tracker
brew services start tempo-tracker
```

You only need `brew tap` once. On first start the app asks for your Jira site, email and API tokens.

Update:

```bash
brew upgrade tempo-tracker
brew services restart tempo-tracker
```

Uninstall:

```bash
brew services stop tempo-tracker
brew uninstall tempo-tracker
```

Your tracked time stays in `~/Library/Application Support/TempoTracker`, and your tokens in the Keychain (service `tempo-tracker`).

## How new versions get here

A new version starts with a tag `v*` in [omniboost/tempo-tracker](https://github.com/omniboost/tempo-tracker). After the tag, a maintainer runs:

```bash
brew bump --open-pr tempo-tracker
```

That opens a pull request here with the new version and checksum. The tests install and test the formula on macOS, and the maintainer merges it once they pass.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
