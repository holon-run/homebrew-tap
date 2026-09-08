class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.18.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.18.0/uxc-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "07cd69256ceda8a73041c8f3af49bbd61032be9054a0dccd1f077659e8a1e595"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.18.0/uxc-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "af5f491024a357ce5c21c7d6a2d0f764bc08f046ea1a59d07efe218299b92030"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.18.0/uxc-v0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9418490f9571f3c31e30d95635daa714e44d8596b4d48497d3e1a41c16c4b930"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.18.0/uxc-v0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "53bbc076fc5487758af69957cfede8375c8d14de322c79b998be757fb1f81504"
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
