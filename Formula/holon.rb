class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.28.0/holon-darwin-arm64.tar.gz"
      sha256 "0e02b997a87efb11be75141a0f799e8307bbc91ba4a7f0e430d01ae2341405e9"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.28.0/holon-darwin-amd64.tar.gz"
      sha256 "8469e6c5395f78b480423cf241821caf997e6d743389dae53646c41d3ab59639"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.28.0/holon-linux-amd64.tar.gz"
      sha256 "2d0440ad92eaa1ae4a472b7ef19e17eb7e35e5b4f851acc9d20bd258938bc7da"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/holon --version")
  end
end
