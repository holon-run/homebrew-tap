class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.22.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.22.0/uxc-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "61d0dc8e6d59af798879b695a9bea4be9599f64eb726a48055a5723fca5b5070"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.22.0/uxc-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "22739faa0d04829d60a12eeddd7b419e3ef3dff4041c2d0931752383c8e953aa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.22.0/uxc-v0.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3ba5b492c62153e69606f958499c2ab6aa06e6a4006947343c7adf78687e3da"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.22.0/uxc-v0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf976281b0e5056b666f252d8fe41f16e7461e1cea92718a9ed3d996ba1e3f72"
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
