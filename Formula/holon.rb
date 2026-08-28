class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.33.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.33.0/holon-darwin-arm64.tar.gz"
      sha256 "421dcae8843fdb6013f0f21935134d6cecbe31be0914db52c4eb40807fb11f3e"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.33.0/holon-darwin-amd64.tar.gz"
      sha256 "5d0ab806a1c660a32d1e53b1bfb1a5480dd11a8510de00c4d057250e9d50f811"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.33.0/holon-linux-amd64.tar.gz"
      sha256 "be9fee5eefbb7d0e2665563037cf148c1620c97f25d519c759fa906b0ab26de9"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/holon --version")
  end
end
