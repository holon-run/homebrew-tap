class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.54.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.54.0/holon-darwin-arm64.tar.gz"
      sha256 "cbae302eada13b0b200e228c07430374c37e86512d32d7530de35c2ab8ffb613"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.54.0/holon-darwin-amd64.tar.gz"
      sha256 "79e08a910842f6cf8eabf42c69442bf34c59fe9b8441a9b89de3f9dbc1a14401"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.54.0/holon-linux-amd64.tar.gz"
      sha256 "89b44083a0d65c7928b69b180fe07ccb93182d5a8a3fd0e44caaff50dbe1f90d"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/holon --version")
  end
end
