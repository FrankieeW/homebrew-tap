class Sfeed < Formula
  desc "RSS and Atom parser (and some format programs)"
  homepage "https://git.codemadness.org/sfeed"
  url "https://codemadness.org/releases/sfeed/sfeed-2.3.tar.gz"
  sha256 "a1daa0ecbe0b77e7540de8d9781d9645e0c068135e1767a54fdc6c380c0c48b7"
  license "ISC"
  version "2.3"

  depends_on "ncurses" => :build

  def install
    # Build with ncurses support.
    # On macOS, sfeed_curses needs SFEED_CURSES_CPPFLAGS unset for SIGWINCH support.
    system "make", "SFEED_CURSES_CPPFLAGS="

    # Use standard Homebrew install method
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX="
  end

  test do
    # Test that sfeed binary works
    assert_match "sfeed", shell_output("#{bin}/sfeed 2>&1", 1)
  end
end
