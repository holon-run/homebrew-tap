class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.53.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.53.0/holon-darwin-arm64.tar.gz"
      sha256 "9fd2d3422e3c0ea8397140f53df461bf2d919b0d546d1d5d3ef8a86ed27c591f"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.53.0/holon-darwin-amd64.tar.gz"
      sha256 "d6fd3d0707d3801c7fa10c46601344fed4713f4dd908836fa5976896b2682020"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.53.0/holon-linux-amd64.tar.gz"
      sha256 "f55474bb5f1c988d5c1294e0a980a9850f7b4f9a21b6aae50522e24e580df3ba"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.53.0", shell_output("#{bin}/holon --version")
  end
end
