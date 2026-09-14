class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.40.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.40.0/holon-darwin-arm64.tar.gz"
      sha256 "7459155559a981df8df81e2a0b517fae1238e2ab3ae3b79f8cea68d36e35ab22"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.40.0/holon-darwin-amd64.tar.gz"
      sha256 "d28ffce5668d892c8db93830ad6a62b37bc7343698a0f532081fe3b50e7f001a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.40.0/holon-linux-amd64.tar.gz"
      sha256 "42744c10539b5d0b00aa983536d38402a865806dbf5ea774acd85b57b84d8029"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/holon --version")
  end
end
