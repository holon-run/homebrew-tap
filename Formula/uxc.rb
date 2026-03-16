class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.2/uxc-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "05d78b674502c6d5b358987411cef66f834e87a8c626f3e5db6af92bf9d0c70f"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.2/uxc-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "009973b3da1ae9a88fbf9c37f07b740cb8ab470e493d6fcea4fc35a38ac003b3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.2/uxc-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d06d09951ced76e7eba33b44a4bf8e29a7cfd44b0aa5a95ca74cf4565c88c7f1"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.2/uxc-v0.12.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b334c0cf22fbe8f408d6147e9917d0b41dd0503963f91036fa018bde3e34c328"
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
