class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.18.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.18.0/holon-darwin-arm64.tar.gz"
      sha256 "81523efc9dbb01d1d2c87a249c99bb242bb63c6b0de1d75e902c8ad9aee3c78b"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.18.0/holon-darwin-amd64.tar.gz"
      sha256 "062fdb1ef97a706a67b73fabbd6ede3c5ac06623c6e25150057b6fd9d8813f53"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.18.0/holon-linux-amd64.tar.gz"
      sha256 "c606e71a28cf03c849e2826c1d2e0ff9cc4b04a70368c823cec3fd708d3c8efe"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/holon --version")
  end
end
