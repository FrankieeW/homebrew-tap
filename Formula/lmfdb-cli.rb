require "language/python"

class LmfdbCli < Formula
  desc "CLI tool for querying LMFDB (L-Functions and Modular Forms Database)"
  homepage "https://github.com/FrankieeW/lmfdb-cli"
  url "https://github.com/FrankieeW/lmfdb-cli.git", tag: "v1.2.0", revision: "ea827a5bd9277ffb3af6cd5a17acdded74a7f576"
  license "MIT"
  head "https://github.com/FrankieeW/lmfdb-cli.git", branch: "master"

  depends_on "python@3.12"

  def install
    # Python package (with Playwright support for reCAPTCHA bypass)
    virtualenv = Language::Python.virtualenv_create(prefix, "python3.12")
    virtualenv.pip_install_and_link buildpath, "lmfdb-cli"

    # Generate shell completions
    bash_completion.install "#{lib}/python3.12/site-packages/lmfdb_cli/shell_completions/bash" => "lmfdb"
    zsh_completion.install "#{lib}/python3.12/site-packages/lmfdb_cli/shell_completions/zsh" => "_lmfdb"
    fish_completion.install "#{lib}/python3.12/site-packages/lmfdb_cli/shell_completions/fish" => "lmfdb.fish"
  end

  def post_install
    # Install Playwright browsers after formula is installed
    system "#{bin}/lmfdb", "install-browser"
  end

  test do
    assert_match "LMFDB CLI", shell_output("#{bin}/lmfdb --version")
  end
end
