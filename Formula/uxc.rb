class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.5"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.5/uxc-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "94f7e7b56024edc2da43611afc0c8ce618c74a854c597df386782be6c2fc72e0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.5/uxc-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "4310e03cf4cb155fac63133b5d3ab3eecd7c26226c5d2ee0e9a968d50dcd66f7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.5/uxc-v0.12.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9a49535a85c6e2a243953966d069af14f78f66c3cdec4851b5835cd22c2b91a"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.5/uxc-v0.12.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a7537630023a4c5567820689c2abd9dc6952665c2e368a45760fd08aa33b2cb4"
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
