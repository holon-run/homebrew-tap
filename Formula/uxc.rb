class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.5.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.5.3/uxc-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "c111a36c7a1bf1b72a2514df76af56da5492a6e281f7fb1d4dedb6353fc790f7"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.5.3/uxc-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "ee322376fc90e60401c8e8c07dba762fb56ff21176c92c48140a1da181d5b6e2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.5.3/uxc-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76168b47220fa3f16f9370c2a115b21e3f7ddf62a407e4d67a35876916148aec"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.5.3/uxc-v0.5.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36bd2e65f319ecd03106c5f6733389d41a8fc66fca3aba3c1415dccb02e933a9"
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
