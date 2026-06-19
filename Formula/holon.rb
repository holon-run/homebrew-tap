class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.19.0/holon-darwin-arm64.tar.gz"
      sha256 "e004ec80a2ac627ed691b3d3a890c17ace7987c55d39bbc21573ea8911088d00"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.19.0/holon-darwin-amd64.tar.gz"
      sha256 "cc4f199530aab7a36e67a26364f7f107cdb03d774c2d54c053d1f975404a137b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.19.0/holon-linux-amd64.tar.gz"
      sha256 "4c5bb4028d0fb9a82837664db18f48c161e3a52cec2d9a15a4f45ed1a8312ee5"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/holon --version")
  end
end
