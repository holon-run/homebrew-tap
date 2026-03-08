class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.10.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.10.0/uxc-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "30842fcae351934053031a71d47fc2fc28fe57400b9669719b9271daa02d7453"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.10.0/uxc-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "c3a967420f6a8cbd9684930dd66d3b28ae683c867873ecadaa6577fdac5d15ae"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.10.0/uxc-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa2ab50fb8515630a53da0af6ff925fdf7e05deb87e3a3167c7dcff3fa6b01f3"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.10.0/uxc-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4562dbea8eb3b05e4debdf2d056ddd1475c0a8733dc10a921be6297fe5749bb0"
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
