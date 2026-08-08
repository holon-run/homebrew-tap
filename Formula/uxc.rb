class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.17.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.17.0/uxc-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "5ab49af22246acd34e41ebeefb5d7bdb4ffccb67118f11889a088cb938850f68"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.17.0/uxc-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "85b6516c60bcd211367296c5e8aa7f541f747ac96ad97327a44264822292b79c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.17.0/uxc-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c21e421e933fac8f2a0e803d6edad4c6c0ba3eac9053bfb7bedb77f57969bb52"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.17.0/uxc-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae92ec65b4c09d0277f49fa2363a7f1f604ca748a812d9fe783da1fabd378263"
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
