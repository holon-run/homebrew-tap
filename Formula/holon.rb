class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.56.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.56.0/holon-darwin-arm64.tar.gz"
      sha256 "2cdfea5a85a00935747c14eed8179008008de2bf6f561e58cde343d2ace99e48"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.56.0/holon-darwin-amd64.tar.gz"
      sha256 "658aba6c9523dde7b2c8d9c4a0fa4723219a8d41927296bb24652053518f5fe5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.56.0/holon-linux-amd64.tar.gz"
      sha256 "e6756b6b8622d4cf8909db4f02712e9e1ce9d838f154d3047820dc02507ac4bd"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/holon --version")
  end
end
