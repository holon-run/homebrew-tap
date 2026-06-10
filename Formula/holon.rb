class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.17.0/holon-darwin-arm64.tar.gz"
      sha256 "01316eb4a9cb90dabb9ffa85f74d4c7468ff145a64db1a87d3804957003cfb91"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.17.0/holon-darwin-amd64.tar.gz"
      sha256 "4a41b39e8d9a03d40ad166ba11a5680ebb739f2b3496d089b5bd3e2da520d68b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.17.0/holon-linux-amd64.tar.gz"
      sha256 "6de29a56c16ba0a2137cdf932f3e58d0a021e47a9891e0bdb99daea1fcea12dc"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/holon --version")
  end
end
