class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.59.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.59.0/holon-darwin-arm64.tar.gz"
      sha256 "ca86471b3306f0f2a3eae4d3944016cc3afc59fbf9c5a68f580132980f471327"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.59.0/holon-darwin-amd64.tar.gz"
      sha256 "b4baf8c033bcafb85081980204e435c9fefd990069abf6234efb3d5c13683405"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.59.0/holon-linux-amd64.tar.gz"
      sha256 "47a1fafb950e1cedb8fbf768a91101febad5b0f837986c5cfd1d15bbf6f8379c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.59.0", shell_output("#{bin}/holon --version")
  end
end
