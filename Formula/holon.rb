class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.19.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.19.1/holon-darwin-arm64.tar.gz"
      sha256 "03e63e0504c3faf39b20f2597ade6cbcba62d17b4510a99985ad97943c7f4418"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.19.1/holon-darwin-amd64.tar.gz"
      sha256 "42dfb0670f9baf0110c86647694ae58ed7ee7409f761b4584d17b094bcbf66c0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.19.1/holon-linux-amd64.tar.gz"
      sha256 "8628a316cbb7c87a9fb7b7cd3c102817fd5071c827cf1bb1ef89b1e7797ac330"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.19.1", shell_output("#{bin}/holon --version")
  end
end
