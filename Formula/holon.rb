class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.29.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.29.1/holon-darwin-arm64.tar.gz"
      sha256 "b6343fab7af88a28130f1a9a9d971eea55328a44ff5216887988107efae9252b"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.29.1/holon-darwin-amd64.tar.gz"
      sha256 "bf4012f4e822bbbf0a48c64aec80470b58a6c6084811c722e208f0450382f68d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.29.1/holon-linux-amd64.tar.gz"
      sha256 "d6f6471e34adf39ffd18e88a968b31d5f7aa5b1eaff67c5e4260e0e208ed5457"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.29.1", shell_output("#{bin}/holon --version")
  end
end
