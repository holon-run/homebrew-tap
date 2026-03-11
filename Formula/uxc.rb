class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.11.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.11.1/uxc-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "a672f6bf09e7285276612f97dcc69236d8c083fbf9d403dfb17b3a4c01c948d0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.11.1/uxc-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "99a45b0b82adefd8390656c2d8c3201e749a5010140f6e13d292f69786240cb3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.11.1/uxc-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c09ad1ae0ec4da367f774ead38f2510b39b402e76f551c570bf02a8ada1865ae"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.11.1/uxc-v0.11.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91103036fe41dd48eb9676a26d91d6ca0fea94591edd55d3f9e1273e338f56cc"
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
