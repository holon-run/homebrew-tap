class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.47.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.47.0/holon-darwin-arm64.tar.gz"
      sha256 "99ce012e2d527b9d48c76006cacf8fc97d344823d77d155ffd056e54469570f7"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.47.0/holon-darwin-amd64.tar.gz"
      sha256 "fd0a75c6baa390dfa55d50a78f87611cfb5415457180b580ada41e637b1527d6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.47.0/holon-linux-amd64.tar.gz"
      sha256 "038dc22867d79e63cb27991e6d3f30171ec81e2c24b80d4474f8a9e8164a7ff2"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/holon --version")
  end
end
