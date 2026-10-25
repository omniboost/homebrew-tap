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

A new version starts with a tag `v*` in [omniboost/tempo-tracker](https://github.com/omniboost/tempo-tracker). The *brew bump* workflow in this repo checks for new tags every day, or right away with *Actions → brew bump → Run workflow*, and opens a pull request that updates the formula. Merge it after the tests pass.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
