class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.44.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.44.0/holon-darwin-arm64.tar.gz"
      sha256 "e854382e3dccf3c912682cc83e699d46d7d3db7fbe5aba769f4b5d5f81aff15f"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.44.0/holon-darwin-amd64.tar.gz"
      sha256 "c039a653bb9b70b8892c241c258e73cd57e8f4d20d409d3734b53717c9489059"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.44.0/holon-linux-amd64.tar.gz"
      sha256 "c29f8ea52f1acb9ac44a8442c90a043664583003b266a6c206ee00cbd60e7e6b"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.44.0", shell_output("#{bin}/holon --version")
  end
end
