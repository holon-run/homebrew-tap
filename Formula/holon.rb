class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.61.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.61.0/holon-darwin-arm64.tar.gz"
      sha256 "217fd4b00a142944a4c7d22631dece285055beed5be9b035f8940ce3d2f8ef2d"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.61.0/holon-darwin-amd64.tar.gz"
      sha256 "1fb8ed5b6bb3a5b761de1d9d456fe2dc4319d1b4abb6c382b09fbe82ce6cda0a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.61.0/holon-linux-amd64.tar.gz"
      sha256 "5a18a1ead313a31458ac1209842ba002c3897ae8447ce4c6c77f549df126ef52"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.61.0", shell_output("#{bin}/holon --version")
  end
end
