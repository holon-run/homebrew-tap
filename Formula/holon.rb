class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.14.0/holon-darwin-arm64.tar.gz"
      sha256 "2475cea3f662c88f899e8744557f8301584df9ac2a85a99af472ad9128139db6"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.14.0/holon-darwin-amd64.tar.gz"
      sha256 "d35a85003022bb732360e9cbcc088ace9b1c51b1532bd65a217409f0ed9f1e28"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.14.0/holon-linux-amd64.tar.gz"
      sha256 "c5cf1a27f6b196ea4404a7813b5b6d37842896441517a2002e48a1136d7585e1"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/holon --version")
  end
end
