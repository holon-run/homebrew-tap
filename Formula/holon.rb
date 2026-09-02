class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.35.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.35.0/holon-darwin-arm64.tar.gz"
      sha256 "de55cb24f92b98cd1f5375891781104fc4a56a4a746004061c42e372be230b65"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.35.0/holon-darwin-amd64.tar.gz"
      sha256 "54c7769ccb22089be07f6cc02d29f793c9d08364bc2b27d0ace76992129c375b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.35.0/holon-linux-amd64.tar.gz"
      sha256 "98ddd97bc16b58608fafae637fc4f360ce368607850d062a1c2603e7999f87c0"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/holon --version")
  end
end
