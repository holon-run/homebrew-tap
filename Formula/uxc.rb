class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.13.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.2/uxc-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "8f5de5fd9b4a5294f4cf25661a3e4a2e1e8d075e4aa5b471c33412d012239e5d"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.2/uxc-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "d67ac2e326188c2f47c816d587c197112ba54bae8c5fd0a7224f06d67fa3b8ee"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.2/uxc-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dec26dd4c5c465fb9dbb87d014f8015a90aabe0207f576aa49e478f608d1c7ba"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.2/uxc-v0.13.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3b2e8354ac259b6dbf763bd65589c961fe47a319e9f0feb16c357ce2ea205c61"
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
