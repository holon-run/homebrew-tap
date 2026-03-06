class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.8.0/uxc-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "f901097b3ad452c4bb8866c1bda74d1c15b9c42953ed3ab8bedacfbca390a641"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.8.0/uxc-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "756e0bf177fa64f69bed068d97dca44d309b459d267ff8a4fd910f1964582933"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.8.0/uxc-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c498a80875f7c10cef6d499e7e015fde4180874989f946fbd474f164d4433f40"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.8.0/uxc-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fac6ec02ba127a79156353108386a4f882ef949b8807e870ac4a01288ddd4a03"
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
