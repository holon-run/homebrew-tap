class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.6"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.6/uxc-v0.12.6-aarch64-apple-darwin.tar.gz"
      sha256 "4d54c429673606a135d4533d872c8e8ed1779194868c898500a0a3e1f0589be4"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.6/uxc-v0.12.6-x86_64-apple-darwin.tar.gz"
      sha256 "c12a7915d413ad602b8e9cf7f0a247387ba1948eccd2a51c05e7a59d2ea1591a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.6/uxc-v0.12.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18fccc9ad97e75edcd650ede0d055eadc39f059eac05c66b294a925032a4e188"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.6/uxc-v0.12.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b80d6183718b0cb9f79439b90cc38dd038534f990f796aa9230516d1482f7a47"
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
