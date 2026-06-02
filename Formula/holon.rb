class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.16.0/holon-darwin-arm64.tar.gz"
      sha256 "dab6fb96e35a4b7b62b7f54a8c1685f12ee5915c5894421c379a2cc8c488cef9"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.16.0/holon-darwin-amd64.tar.gz"
      sha256 "e6cec23d26815133d4bb97889082ae20de7e52b124fa4d401d0626146b2901e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.16.0/holon-linux-amd64.tar.gz"
      sha256 "4d056d6d4f15084422578ec7fe7527f2f1b420ba10419cac83af999ba1e2a1e8"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/holon --version")
  end
end
