class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.21.0/holon-darwin-arm64.tar.gz"
      sha256 "dc5b4900e55791186227de75d8299d27a8c4f5798564456f7168044473c270c2"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.21.0/holon-darwin-amd64.tar.gz"
      sha256 "495c6bfb7e23e354b6825783464dd46dace00650577c48059870f7d5a7008d5b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.21.0/holon-linux-amd64.tar.gz"
      sha256 "904c729d1465b179e1ffb7f697883f9e321e99af1b53fa1f45297f232b415f7d"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/holon --version")
  end
end
