class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.55.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.55.0/holon-darwin-arm64.tar.gz"
      sha256 "6c719d534f918392a2dc0d08e8996ed4bbda031ebfba616aae493c876f8e9302"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.55.0/holon-darwin-amd64.tar.gz"
      sha256 "8d9a28ce47a4f0c5f969336cd0fd005437081b574a8259288a83803705d0b4ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.55.0/holon-linux-amd64.tar.gz"
      sha256 "7ba5956be0739da059ae296106573e58ee3855b48a9947d3c6eab3856d0805ba"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/holon --version")
  end
end
