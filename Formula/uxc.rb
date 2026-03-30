class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.7"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "5e6882274e701a700e61f087a7c2e881f5b4a503b9b217b9148d5174005b5121"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "c1028c4d1399a884fc2e9fa994eb13ecbee4bbc445a53f7e4102bc0f153ee347"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c181d9ec0068d735409383c37fce6d1a593f4afe7f7c1694e2250ba93c3437f2"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f97c6c9058a475d083945f4f16a36af6a524e625b1a20decfab834866f37df8b"
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
