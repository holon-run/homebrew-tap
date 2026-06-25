class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.22.0/holon-darwin-arm64.tar.gz"
      sha256 "09f54e0be92fe269283eb5da0975bd14ad07cead55b2944ed247e96641febede"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.22.0/holon-darwin-amd64.tar.gz"
      sha256 "26cce1213911714ce7d2bedd138dac74d63603165bb9e151600fb7b1363ee462"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.22.0/holon-linux-amd64.tar.gz"
      sha256 "22d54b862c3bc61abeed5b1e23e99f30f79abc68c03ec1ed5965cf8d2f3cb4ea"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/holon --version")
  end
end
