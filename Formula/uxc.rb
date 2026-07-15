class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.16.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.16.0/uxc-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "db3a346e50252f4895093582d2007dee55c49e4eafd1cc590cb7a12f55e51100"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.16.0/uxc-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "830be4673b5ff5a1c87789fb5fe674357c1ecb814322663b5ca82d81b8528dd5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.16.0/uxc-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f936b08b4a5e10a9c3333fa0d0c7333b55f197ec2a52d934914f78f66cf845d7"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.16.0/uxc-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "50fef9c2e7e656519960512cb8cd85a29701e08248d052c8cd0e6429f71c984e"
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
