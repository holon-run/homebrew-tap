class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.13.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.3/uxc-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "50faf9ca187bdb2edf329af046909a1bf65d824f3cd320f3cf85ac7e57d7eca4"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.3/uxc-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "f74737d13bde5ae087533e445c0fd36e34a2d735e41d540aaab1a15a0b1a376f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.3/uxc-v0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0772abf83e898646c55a48e33128da988ef634b23db29805fbd9b40a42fde7b"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.3/uxc-v0.13.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ce29fed0a226e909cd8362cf94d79158966b9800538ae5d43c411758a1581818"
    end
  end

  def install
    bin.install "uxc"
  end

  test do
    output = shell_output("#{bin}/uxc --version")
    assert_match version.to_s, output
  end
end
