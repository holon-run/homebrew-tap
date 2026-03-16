class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.1/uxc-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "4051cf285a5838f81aa90425c82c177f48bed5898952b2ff1f46fe4cf813406b"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.1/uxc-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "f7cecdcd5e857db53c696fc40c7516bd5d2391d20c4b1c81eb0ddc2e370bbdd3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.1/uxc-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf0e2530a8249dcb2d93e5d360b65a4a6e2d0f950484bd54810dc2e4cbe36706"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.1/uxc-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "728caeb1218c727db8030c223235ea768eb8eefb15b2eb52c5897d4e0c470324"
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
