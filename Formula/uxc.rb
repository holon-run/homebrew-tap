class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.19.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.19.0/uxc-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "6bba1451fe9b733faa8e0414f3e9c572908f3f99feb474047bae375aa70b77f8"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.19.0/uxc-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "5162acb1fc1b3039b4db2214f8e70c597720b74a9a2c961a11ea3a563b387ebd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.19.0/uxc-v0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ce32708b8674401102984ce7b5070ea2c118ef67420656f99d5cd2b1ccb3d42"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.19.0/uxc-v0.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "14d6bc450b54bb859763c7ff16a3e52586d2b15c805e2e53cf2471c0227c5830"
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
