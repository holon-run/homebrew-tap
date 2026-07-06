class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.27.0/holon-darwin-arm64.tar.gz"
      sha256 "87ca2d0bb5005513bebb9a12c23709a8ce1aead09b8cc826953ae673601ea5d1"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.27.0/holon-darwin-amd64.tar.gz"
      sha256 "7a6650dfd75464897e08d6554b0771eded2253729501f7254130ce27dd3480c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.27.0/holon-linux-amd64.tar.gz"
      sha256 "49c72110718b3ce8aeb137e85b32fc77c4a07a6d06ed04413360b3fe8465068c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/holon --version")
  end
end
