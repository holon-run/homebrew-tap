class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.50.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.50.0/holon-darwin-arm64.tar.gz"
      sha256 "d84e3c05eacdfea4308270b6a39751e10b0d3a4d24c06794365ff401dd3ad25c"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.50.0/holon-darwin-amd64.tar.gz"
      sha256 "8e410838cbe6c55f36f335bfbc15028bbb25679f024d3e1a7c49f49155e3c3ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.50.0/holon-linux-amd64.tar.gz"
      sha256 "ba1f006752028168b09c96716ca8154a782d7cb5a12be12784fb17e7bb0d140e"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/holon --version")
  end
end
