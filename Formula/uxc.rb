class Uxc < Formula
  desc "Universal X-Protocol Call"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.2.0/uxc-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e0e5b5cc2965701db306d99c0e7884e82bebfcf5cae2dbee801810a8a890b93"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.2.0/uxc-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "d5002e50af23740ec5d5f951fbb9256de95b1ff50633cb0afb1a7a149598d572"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.2.0/uxc-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "482e7d3052e54f3f82fa4a6bc336c656e5709f56cb331fecc8ad38c1dbe00caa"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.2.0/uxc-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e15ff1dfd96f673ac412df09679be992d9d30e2b148a6d54f21688357fb09c1"
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
