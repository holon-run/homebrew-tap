class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.25.0/holon-darwin-arm64.tar.gz"
      sha256 "74ac4a007e725b1bea88092e9b09eec05a07c4a1308acd7cae42be7a39402a38"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.25.0/holon-darwin-amd64.tar.gz"
      sha256 "ac11c8f990b67fec337553f50b0e5b76f06261cf14cb449434794998fa8f0aaa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.25.0/holon-linux-amd64.tar.gz"
      sha256 "da0f62bc07a635a70989dc28e7e88eb7320aa369988457956b7412694261906c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/holon --version")
  end
end
