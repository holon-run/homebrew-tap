class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.4.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.2/uxc-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "ea465f93a6fc0435e276b1171ad9a1e197050c4bf5f1f3909eec9725e4079000"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.2/uxc-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "b1aee97a1c6b96553a39cd043d24f4598fd2d353adf5ff37c6a3ecc9343bb0fe"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.4.2/uxc-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fc51487c56ca2707277b85e6c5dd1764102faa1266a2f8b8876bdd5839b49ae"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.4.2/uxc-v0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "812cd6858989e24a02f182ba200e166f5e77a4d8f1e7e54257b509c193bc2360"
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
