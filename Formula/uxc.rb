class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.3/uxc-v0.15.3-aarch64-apple-darwin.tar.gz"
      sha256 "132bc6601eadeb0c35b5a010487ae51c5e0f4423e1c3cb20475b74b8f749a966"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.3/uxc-v0.15.3-x86_64-apple-darwin.tar.gz"
      sha256 "977d0a37eb6be686deb3ff25e4e01a618c3377128f175f7576dd2ef6dcc29a28"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.3/uxc-v0.15.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd143ecde57a1153c34faa015429dfb3f00ea0e8a6a3950f3f5d3fca489c939b"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.3/uxc-v0.15.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "18ef982cb4fe85acedbde20c1abdb2e6789fd15833f1c379fdb419c6204502e4"
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
