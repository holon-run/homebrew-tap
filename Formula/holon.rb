class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.41.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.41.0/holon-darwin-arm64.tar.gz"
      sha256 "a3b042d436ee5593bb4b0963bffbc8684fce1c55cd60d478390f0e1b89da2ea6"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.41.0/holon-darwin-amd64.tar.gz"
      sha256 "2efd6013021f0aea1edf46aabe4f5c131a65e321f709da1aa883dd7973834ba5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.41.0/holon-linux-amd64.tar.gz"
      sha256 "2fda7a2fa476d578fcc81dfd7ab5c60320ddcd60512b7ffa7625040779f0900c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.41.0", shell_output("#{bin}/holon --version")
  end
end
