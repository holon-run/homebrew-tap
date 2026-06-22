class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.19.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.19.2/holon-darwin-arm64.tar.gz"
      sha256 "263f1e7612d83599ee4b3bb72f186cf1c00c9f086dd77b1f8943c1fde89efbaa"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.19.2/holon-darwin-amd64.tar.gz"
      sha256 "0ff39cd4eda4e304537cb0b3d06f1fda1d62d9d19e4a742826227d74448a70dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.19.2/holon-linux-amd64.tar.gz"
      sha256 "999bde91fced7e70e211b5426c7b5a1a2b890b939172248375ac1b1c2733d29e"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.19.2", shell_output("#{bin}/holon --version")
  end
end
