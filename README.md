# Homebrew Tap for FrankieeW

This is FrankieeW's Homebrew tap for custom formulae and casks.

## Available Formulae

### Sfeed

Simple RSS and Atom parser with various format programs.

**Installation:**

```bash
brew tap frankieew/tap
brew install sfeed
```

**Documentation:** https://git.codemadness.org/sfeed

### Task Notifier

Task completion email notification with OpenCode integration.

**Installation:**

```bash
# Full installation (default)
brew tap frankieew/tap
brew install task-notifier

# CLI only (without OpenCode integration)
brew install task-notifier --without-opencode
```

**Documentation:** https://github.com/FrankieeW/task-notifier

## Usage

After installing the tap:

```bash
# List available formulae
brew search frankieew/tap

# Install a formula
brew install frankieew/tap/<formula-name>

# Upgrade
brew upgrade <formula-name>

# Uninstall
brew uninstall <formula-name>
```

## More Information

Visit individual project repositories for detailed documentation.
