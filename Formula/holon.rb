class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.29.0/holon-darwin-arm64.tar.gz"
      sha256 "185e1f3539c331c9089559014e182b00f2c57b7fdaf7b9f85de17564249b289a"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.29.0/holon-darwin-amd64.tar.gz"
      sha256 "74dda48994118b34c6988157df54ef7f9a8c4962cb37f25ed3d8387b7666c17d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.29.0/holon-linux-amd64.tar.gz"
      sha256 "c0369584fd2b2d0d49d76a2fe07d4978445d0356146588cd0e3d59f6de10916b"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/holon --version")
  end
end
