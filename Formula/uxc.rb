class Uxc < Formula
  desc "Universal X-Protocol Call"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.4.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.0/uxc-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "11ee764c7e2b52bd984a8e86c5ca312dde3aca90f2ced81f776fdcaabd144b3c"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.0/uxc-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a8e380dff8656c102de027bcb07416a61b06c1f6d981cbac15301b5e3f9e2bb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.0/uxc-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6368d642b289ecb8d3bd00f9430097e8d6ab7dae8c0fa39b774e046e1faf2c91"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.0/uxc-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "797e69d0711f7d03b3b820665f9b77faa70fb91393eae4f001bb4f6956c4b951"
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
