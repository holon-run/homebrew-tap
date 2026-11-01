class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.57.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.57.0/holon-darwin-arm64.tar.gz"
      sha256 "2bc5de2064da5168d1e4c7897c1a56bb73aa4f84ad8c3a06668cb30fc3eaa998"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.57.0/holon-darwin-amd64.tar.gz"
      sha256 "b124c010f61d5969a4d1f16559deb4a8ee90ec2176e673a49406291e459a71a3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.57.0/holon-linux-amd64.tar.gz"
      sha256 "987dc15e48049aac8496e151d8385e36f4888d7603a3649f4006dcf4320d7d82"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/holon --version")
  end
end
