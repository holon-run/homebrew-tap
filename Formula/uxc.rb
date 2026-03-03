class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.6.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.6.0/uxc-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "78782056f89ead81a76519a78bab2bbe95b0e861e89c96815689f1a3f041edb3"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.6.0/uxc-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "0eabb91a268f993b7ed81e0ed2e884e9a3694291e6f9debda3c2c1c31137be31"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.6.0/uxc-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f459998de26e36e2f75f952dde01362a3c7909112b79fed3603333af5e72b0b2"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.6.0/uxc-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "378402b068704086589c16f8c6dae91816108a813c9cb75db0013d23445e6464"
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
