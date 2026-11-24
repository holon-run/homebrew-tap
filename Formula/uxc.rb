class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.23.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.23.1/uxc-v0.23.1-aarch64-apple-darwin.tar.gz"
      sha256 "c56bab73f9f43d24a1896c0691817ab74f97e6e83bb0468625605713a9a04422"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.23.1/uxc-v0.23.1-x86_64-apple-darwin.tar.gz"
      sha256 "382f8ab1e3d8c5210beee84fd38dd9766649e91db8a2ede69c2483439b5374d8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.23.1/uxc-v0.23.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03ab9c7dcf9f1c90ed53006751da24da6ad06abf64d2182bf60b1f7f456b4b2a"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.23.1/uxc-v0.23.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f55fbe27fdbf76f7dafd6694cb3695f5b8908d1adde73d06ff12599d49ac06e2"
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
