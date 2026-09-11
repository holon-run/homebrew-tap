class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.39.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.39.0/holon-darwin-arm64.tar.gz"
      sha256 "cd16c5245bb0f18f41d2d5a735eda009d04c5d3066f8a36291a5d747c134cefa"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.39.0/holon-darwin-amd64.tar.gz"
      sha256 "f3b583433fcd5ddadc26bbef164c9e05464849a422cc3a8ef80f0206a467bfbf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.39.0/holon-linux-amd64.tar.gz"
      sha256 "8b24db99f81eec7ab72d381eeb43f0281269b49d610065b19e54c78ad76b8f57"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.39.0", shell_output("#{bin}/holon --version")
  end
end
