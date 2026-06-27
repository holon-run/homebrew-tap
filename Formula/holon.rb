class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.23.0/holon-darwin-arm64.tar.gz"
      sha256 "1a1d2de05a27df688d9fe8a60d782d6b032444fc4b27a70a8c53a49aa87dcd08"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.23.0/holon-darwin-amd64.tar.gz"
      sha256 "7a58936c3a762136ca1a4d2d17d0ef094de7a23b1a7587b43e31aa72cc9fca71"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.23.0/holon-linux-amd64.tar.gz"
      sha256 "70bf4eca3cfd9696bc2eb181da0338eb700f1e5b92af929764faf54da7fca327"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/holon --version")
  end
end
