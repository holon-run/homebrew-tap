class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.15.0/holon-darwin-arm64.tar.gz"
      sha256 "322133af3717906e556d7ad9de3acc5524efc0590c7e1b24ae96c7987c88e202"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.15.0/holon-darwin-amd64.tar.gz"
      sha256 "951ea8a6a81fa78af083ea9c82b585dbbd4d791dc5bd834858d3348c0ff853e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.15.0/holon-linux-amd64.tar.gz"
      sha256 "462606956196b9ef37c429b4084540b88ed5ba9743656503b0a5130ee88039fe"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/holon --version")
  end
end
