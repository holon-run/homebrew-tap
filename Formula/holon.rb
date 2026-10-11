class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.51.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.51.0/holon-darwin-arm64.tar.gz"
      sha256 "91f42f6f58320c1492292b12437c421e5a6706fe448a7a33c8ed33e5bf7b6232"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.51.0/holon-darwin-amd64.tar.gz"
      sha256 "3f0054e7331c5772c7fd4cf673840e76d10f630326f346644b371f74738841b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.51.0/holon-linux-amd64.tar.gz"
      sha256 "830f569c4d030d308cd7bb49a89a72e7e1a71340e543302a847ebdc4edbb7246"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/holon --version")
  end
end
