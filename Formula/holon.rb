class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.43.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.43.0/holon-darwin-arm64.tar.gz"
      sha256 "214b85bee8a1ac17e2d7053fa9973c56ac81be953d123c36450978cb8bb7998b"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.43.0/holon-darwin-amd64.tar.gz"
      sha256 "81eadf2b30178f052e3ff67f557d4d8e5582ed972f4575dbd2465417fb08dba9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.43.0/holon-linux-amd64.tar.gz"
      sha256 "acbdc55e6c6508e8d81bfd5c23e69f971490496b2faff2c61b2d32c4f1cedd70"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.43.0", shell_output("#{bin}/holon --version")
  end
end
