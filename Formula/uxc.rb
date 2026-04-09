class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.14.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.14.0/uxc-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "7fe8358081490a4f69888cfc85a8d882f94f2c009a2fe8b39051ee884ccb641a"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.14.0/uxc-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "77f9844ee35e3d0847823b10f997100f9125826ee0f9c8cce2a810d08de8dcd3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.14.0/uxc-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "089ff2d421d8ea17cb0a126eebc1f94b73627f0e03c7512bf5b974ea2f4da0b0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.14.0/uxc-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "519f7b30799e90ecf4e5babaaa36d7309317f8e1ab5a19533055973c7bb94456"
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
