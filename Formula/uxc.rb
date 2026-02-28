class Uxc < Formula
  desc "Universal X-Protocol Call"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.4.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.1/uxc-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "e15dcb9b699ec0af4b7ab531f21fa4f58e5f12c4bb69fb5df61b055eace59ddf"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.1/uxc-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "0dbf56a1466a527924d474c5d6093790f7f1f33790515aff706941cc250d6929"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.1/uxc-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fdae1a6f8a3818b00e38b8c3c1042d1891a22e5c7432142158f8c31b6caf3f7"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.1/uxc-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5a85d1d768762fde22e0b6b35d540e6467cacc96aa793d61321da5365e8b7ce"
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
