class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.38.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.38.0/holon-darwin-arm64.tar.gz"
      sha256 "ba33f4f86ae57279b665f5d3699000077b391c394f8fbbef5ba8e317e8f875da"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.38.0/holon-darwin-amd64.tar.gz"
      sha256 "1a48b36a0ad83ff4243c197eedecf1b596e94e4c61f72c0ef821c4660998638f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.38.0/holon-linux-amd64.tar.gz"
      sha256 "822a47842481a5958cf9fd85f313bf68085c79d0fd063d7c8023f1be958e8a5a"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/holon --version")
  end
end
