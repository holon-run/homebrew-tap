class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.13.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.0/uxc-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "c033818fe0a355d1e44494ccee8b46745936b11b8c85e12e02f1f44175d3566f"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.0/uxc-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "160dded0b51d482a3ac50b3a183060710b2be4186c50ef5517ad6bc498dfc659"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.13.0/uxc-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b63576a687f871d9547c7815b143286887d3308ebf6ad2034e10bff946451e6e"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.13.0/uxc-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "af6e6e088ac71fdd224c673a8d8ce968ba9126a26c78dea7f711872e4fcd983d"
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
