class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.18.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.18.3/holon-darwin-arm64.tar.gz"
      sha256 "0445261b5928dd417af494ddac8d8da9fbe85802085011362b5ebdc6fb16a168"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.18.3/holon-darwin-amd64.tar.gz"
      sha256 "8468656646932e17b3f34b22f7c89f57b243dee18543d4d2fe3df8af2bfff890"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.18.3/holon-linux-amd64.tar.gz"
      sha256 "10454ad5f718d850f3a6b961594df5c31a5d729b0f3217613b87304c5679c741"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.18.3", shell_output("#{bin}/holon --version")
  end
end
