class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.46.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.46.0/holon-darwin-arm64.tar.gz"
      sha256 "65e5051bc622d132f9e1c2fe5c35d4cddf7bc8815f5add97b1e61bc5c7d4817a"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.46.0/holon-darwin-amd64.tar.gz"
      sha256 "20ea02b02231d7c51163cdc33c7f88adb068a827eaf4a0ce302171200b920a70"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.46.0/holon-linux-amd64.tar.gz"
      sha256 "334e75aa760f2e76a0583e66aa2b6a2fb5d71605e4465b556fa284f89c01c572"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.46.0", shell_output("#{bin}/holon --version")
  end
end
