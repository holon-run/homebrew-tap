class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.48.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.48.0/holon-darwin-arm64.tar.gz"
      sha256 "9e4d34cef4a723bb9747a45a4a2d83113237faf5b4ec55d39d0539c282bdaf3d"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.48.0/holon-darwin-amd64.tar.gz"
      sha256 "3871ff1763e83f8afa6fabf0be6888a652a9525dd98b52a027a65529fabfba8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.48.0/holon-linux-amd64.tar.gz"
      sha256 "cc39cce0e5312b611b06c6433ec959fef4863acbfbe950ba58d811ea10165027"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/holon --version")
  end
end
