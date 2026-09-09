class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.20.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.20.0/uxc-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "ea89c55cc8f2ea053876509e4b037ace8610e37964db82e9b4023948a7c13b51"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.20.0/uxc-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "dbc0e5b5c284492e1c62bc55b662df2d5ba2a8ae03d73efe38e6b5cc2cb9f402"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.20.0/uxc-v0.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a909f7113cca4e62f791242e01e58dd1fe304e12637d76281b73eb6701e80e15"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.20.0/uxc-v0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78ad522dfdd93a143d15e8083b7835e20245224b234bdcb9767acb0f050c429d"
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
