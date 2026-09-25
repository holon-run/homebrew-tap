class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.45.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.45.0/holon-darwin-arm64.tar.gz"
      sha256 "896c1de0eb934470c457c6c99ef8c35d7b96c2f8ec40cab0ceb06ac19518cc79"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.45.0/holon-darwin-amd64.tar.gz"
      sha256 "5ac495b96a2c024dc2cca8e326e690cfb027381447da6a28e020dec16b9e8cf7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.45.0/holon-linux-amd64.tar.gz"
      sha256 "e2d2b92d0d587c917b9a179f8d88525ed6a78f89edc473a57ebc4d221008abe4"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.45.0", shell_output("#{bin}/holon --version")
  end
end
