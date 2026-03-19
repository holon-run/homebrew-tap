class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.3/uxc-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "7e3268da5d3589852ca1c46e9904143074b857315cf4022b507784978f02513e"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.3/uxc-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "d67c5de2ccf28338411fa0079265ee5f5c5e9607e95e33ca067c9d15e25217c1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.3/uxc-v0.12.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ca85548c2d630def08053e63e9f1b1dd55580b10f0e37b09533fcab6a15fd38"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.3/uxc-v0.12.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bc04f90440f1ce1f2e179803532bcf0393a090a32727e89ff1344ed7efdef97"
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
