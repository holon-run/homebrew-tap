class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.21.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.21.0/uxc-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "db96f5a102522fb36d1366c197f66a29d1722ef95784d89ded03b5de0d82062b"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.21.0/uxc-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "574a04cac9b54a57ab59fb0ed54af571ad889ed313ba8af2538f4b6ffec49ab1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.21.0/uxc-v0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d55fd83273179f4bdcebf9e05fd4cccb878c698ad509e13147e64b03267b7752"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.21.0/uxc-v0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db162ca96ce246cb9f9f3351c6e1e798ff871ea9e1391bea7d369b283e07aeca"
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
