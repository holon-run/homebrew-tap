class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.5"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.5/uxc-v0.15.5-aarch64-apple-darwin.tar.gz"
      sha256 "a0f45e4ec092adc8d64f73bb40cfba5bbd2114496a4f57fe0f6c2472a1fd3bb1"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.5/uxc-v0.15.5-x86_64-apple-darwin.tar.gz"
      sha256 "dc5f6b5a25f88461c636d24a2c7b37989ceabdc6426199b2bee80298a45e9931"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.5/uxc-v0.15.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56cd04d6c6b75862dfe868989d5b66f42e4dab9b59c9083789fa1e0a451d09a9"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.5/uxc-v0.15.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "14d4934d1540470016571946dfde04e467457e06c91c7cec5ba075cca9d3fdc7"
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
