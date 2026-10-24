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

### LeanMgr

Manage disposable `.lake` cache state across many Lean 4 projects: cross-project
disk usage, toolchain and worktree audits, and dry-run-first cache cleanup.

**Installation:**

```bash
brew tap frankieew/tap
brew install leanmgr
```

**Documentation:** https://github.com/FrankieeW/leanmgr

### Headway

Keep apps and CLI tools built from GitHub current on macOS: follow each repository
commit by commit (build from source) or release by release (download the asset).
The `headway` CLI is built for AI agents (`--ai` XML, `--json`, stable error codes);
the menu-bar app shares its state.

**Installation:**

```bash
brew tap frankieew/tap
brew install frankieew/tap/headway          # the `headway` CLI
brew install --cask frankieew/tap/headway   # the Headway menu-bar app
```

**Documentation:** https://github.com/FrankieeW/headway

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
