class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.8"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.8/uxc-v0.15.8-aarch64-apple-darwin.tar.gz"
      sha256 "4475790dcec1c3eec0559f992882efc2fede12a15d6dd3127854c9a93da180fc"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.8/uxc-v0.15.8-x86_64-apple-darwin.tar.gz"
      sha256 "0435477facc751d7348a9faec2cf94fa893e27af44fd9481eb62b0bdbc150019"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.8/uxc-v0.15.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97d2779361da68f674c49ac33ae5ea0fd52bc2d9b63abdc3f94fd51e7194ed09"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.8/uxc-v0.15.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bfd4f0516fc400f98cda4250c993e23b5736a1b6dd9d2ab4bc2b0365092496dd"
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
