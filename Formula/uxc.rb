class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.21.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.21.1/uxc-v0.21.1-aarch64-apple-darwin.tar.gz"
      sha256 "2eb708b6eba63c1b64dc3d468a1ba47b2b185a8405a1a1288fffd639d85d99eb"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.21.1/uxc-v0.21.1-x86_64-apple-darwin.tar.gz"
      sha256 "50397b3296d615a8a50d67cbc10f496fca77dd5f678b6482ee3a1c556efdf023"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.21.1/uxc-v0.21.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cec5be0cc35d4c58ea0a52d64d962245f68793a0e3f20f94e9a36f131055c92c"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.21.1/uxc-v0.21.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8adba340ca725140bc04b24596dacb7204eab554c2afd4414baccd338c3338d5"
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
