class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.15.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.15.1/holon-darwin-arm64.tar.gz"
      sha256 "c59a5c63cfdb24a39e8cc6f963726ede92424e8e955d95d07728828456ed1131"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.15.1/holon-darwin-amd64.tar.gz"
      sha256 "fe3976a198f37dc7a01597d09c96bbea102796e46625c4d7c09f61c99fb54700"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.15.1/holon-linux-amd64.tar.gz"
      sha256 "6ca53ef793cb17936b27030e5ff7cfd7308ed469ab9376f00b45b9750e2878bb"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.15.1", shell_output("#{bin}/holon --version")
  end
end
