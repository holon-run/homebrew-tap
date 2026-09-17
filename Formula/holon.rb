class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.42.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.42.0/holon-darwin-arm64.tar.gz"
      sha256 "4777546bea423772bc66fabb2aa9967de9ed9b93fc5547312126dbe798e2c321"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.42.0/holon-darwin-amd64.tar.gz"
      sha256 "ddff74dd1279cb59138b9f5ca0c96b08462af997b6be69b8b204ad82d8d4e07e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.42.0/holon-linux-amd64.tar.gz"
      sha256 "4801463ca8a98e5d7b96fb3c9fc174a99703011055c3bedcb1b804844417acdf"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.42.0", shell_output("#{bin}/holon --version")
  end
end
