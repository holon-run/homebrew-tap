class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.6"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.6/uxc-v0.15.6-aarch64-apple-darwin.tar.gz"
      sha256 "0baa9373d014d2ee68cfbfd7ba267b8ab1e049a801e8777088c18ed9c8f8c3c9"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.6/uxc-v0.15.6-x86_64-apple-darwin.tar.gz"
      sha256 "26a09fe7443257a7e32ad3edc4b71db442a5e5cea15fb5339c4364ebfdf2d02e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.6/uxc-v0.15.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42112c16b60ea2f839756ec403e27ced89deea62d2110436b43d398fcc859b92"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.6/uxc-v0.15.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e15df306f3dbad3942527a524964df8678f767b60e3023e9ca425d44dde93342"
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
