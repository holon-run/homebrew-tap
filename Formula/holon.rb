class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.30.0/holon-darwin-arm64.tar.gz"
      sha256 "687afa69444f409dedb56b7bcdf97b59c5fed11b55d29a5ba0169452c3d61529"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.30.0/holon-darwin-amd64.tar.gz"
      sha256 "a8f111dd4e7a3c85717db846697c24c5ce3e5af5f53fc14ae6cd31e385e9081d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.30.0/holon-linux-amd64.tar.gz"
      sha256 "20d5b7c544c9d55977188e69e03fc90825748c5d26dd47e9d5b32c9146c4e32c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/holon --version")
  end
end
