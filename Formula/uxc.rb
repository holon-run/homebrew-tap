class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.8"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.8/uxc-v0.12.8-aarch64-apple-darwin.tar.gz"
      sha256 "816cf8815d09e8e04ac038ebd7b95a425b951966dfc1e7dd9d2698bf0e168811"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.8/uxc-v0.12.8-x86_64-apple-darwin.tar.gz"
      sha256 "6de82a4bdbb150c7f5e05d3ae96c84f28f9c6e43282929a1f989304b11f05df9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.8/uxc-v0.12.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81f152a5464d2dcbabb22ad53196f791b1384bf5a08d71474a894dc83cb1c7d7"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.8/uxc-v0.12.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3bebc73da6ea5fcd90ea45bf64c387b8b66b2393f38edea2d3dbd58099b9c1ae"
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
