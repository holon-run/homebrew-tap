class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.34.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.34.1/holon-darwin-arm64.tar.gz"
      sha256 "faf33df82a2f2b05b7f0e5419e6f202d72c7f7d9a9b692b38b58200d18a6d5ee"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.34.1/holon-darwin-amd64.tar.gz"
      sha256 "bdcb9df192f7c08144d6fdcec3c17b957cb9ec5ca81af89b8145ff6461088f33"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.34.1/holon-linux-amd64.tar.gz"
      sha256 "269103a0deac37f876227c01fa07e4fadb2ef37dfd279edd9ad68a4ab1beb927"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/holon --version")
  end
end
