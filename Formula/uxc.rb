class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.0/uxc-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "0dcfc6c05107afe2e064bec5f0b0764111e341f375566b8af41d0d315149adce"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.0/uxc-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "2baa03f0c07c394b4e5caefe037ff6cf633694d035e963b6924c73e5d868747e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.0/uxc-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c9f04997d74f5697252915d31d55a71d81bcafae5d975b7a11ab1be42be072e"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.0/uxc-v0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4013f1fe859e0d566e79fbedc79fcd81048ea51c5adb1cb3cd0615112d08f723"
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
