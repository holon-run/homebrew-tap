class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.62.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.62.0/holon-darwin-arm64.tar.gz"
      sha256 "8a6bd79a192d671307eb0ec96f9991790f47924da7e80421a196f2bc8cd0e9d2"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.62.0/holon-darwin-amd64.tar.gz"
      sha256 "f608e34c9831bf93fcb26cec67ac135023da3ce1895c4d0bd494cfcd315d910f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.62.0/holon-linux-amd64.tar.gz"
      sha256 "fac38ef8d20b9ad309add5bcc2d06983fa68e06715c619eeb2824f2612cab795"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.62.0", shell_output("#{bin}/holon --version")
  end
end
