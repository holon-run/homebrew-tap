class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.11.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.11.0/uxc-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "6a26e11b81cc0e2b25ae3a4ea1bc096b3dd048bcfc0d756e3fe797ba1450325c"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.11.0/uxc-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "3324e21a8b2d37eac020c345d821734d766f84319e1bfe2ab1a4b2693cd6e92b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.11.0/uxc-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffd093318affc059ea3f4477e9096bf3e219a3714babaddceeb6c947a98572d0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.11.0/uxc-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e113f5396e99016f7a87ab23228445f46f036f0165edbc351dabfe178b79894"
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
