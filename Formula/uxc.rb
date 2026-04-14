class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.1/uxc-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "2e3edee8336794a8baced2f1ddac012538392e1896bcbd961bf40ebb0230fd70"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.1/uxc-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "871816c7420162e4d31c49ee29abf1661ae64b5cc19478291e0a25de880daf41"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.1/uxc-v0.15.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1d701082527b115bfed99796f26cdd09eed353bd35489d0ff8107e84f02fae1"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.1/uxc-v0.15.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8114cdd873fb92fd02c6286cafdacc00666b18f0c1e5d8356b784cc0ec566243"
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
