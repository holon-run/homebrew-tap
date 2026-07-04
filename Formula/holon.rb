class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.26.0/holon-darwin-arm64.tar.gz"
      sha256 "f6bbeb44cb45a080614c2dc5e3f97026637b3398b1ff10981cbba5978d4756b7"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.26.0/holon-darwin-amd64.tar.gz"
      sha256 "4dc63bd7e6b3929666287c3427ea897d0c0b9323c3a014f5843795c314162629"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.26.0/holon-linux-amd64.tar.gz"
      sha256 "caf2e70639394ab72be27d073705013f98ed4e010dfb7750688e4dbaaec26002"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/holon --version")
  end
end
