class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.7"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.7/uxc-v0.15.7-aarch64-apple-darwin.tar.gz"
      sha256 "adaf550788d25e4606fb9a4c50dd904f93d616ca7635071a50d4a825225d0e63"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.7/uxc-v0.15.7-x86_64-apple-darwin.tar.gz"
      sha256 "ce0b12a27a103f106589aee8fa628f67c05d7f30998e73cbd1816ad7d7345144"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.7/uxc-v0.15.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "450c0f1adeb0455bb973d3b8c153b6ae2c69c26b3e36db79b235113591f6c92c"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.7/uxc-v0.15.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0da84e0928196da116029e39526911ffa95b518a96c3d8bef18501445cd48cbc"
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
