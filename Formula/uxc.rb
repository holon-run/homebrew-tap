class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.13.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.1/uxc-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "4e0946df1d3e600deddc1cb3bc1bfd72c32b092c60853cc91b4053503abf55ef"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.1/uxc-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f718dc7a773f6a6ac99a68eacd87bb2826eeb1e127b05e76d01bb0c6ddd0eb1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.1/uxc-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a780a957f9c6a7d11e3600cbb3e38ab0d8f820bf234791f61f81d1a001359f2"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.1/uxc-v0.13.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "30df33be3e7f90cf19264c0eb2d035071d4d8615ecc4f64c84677bd6a06c2736"
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
