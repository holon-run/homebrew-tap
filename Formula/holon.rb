class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.60.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.60.0/holon-darwin-arm64.tar.gz"
      sha256 "35e94a4b4c66834bdab3d0cb1fe2101952c25bfe67ef7a0a084c9a65def2c276"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.60.0/holon-darwin-amd64.tar.gz"
      sha256 "14291965bc8c89ced0cba62762dc7527307ec1023c8410bb0aaaa680d8bf0977"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.60.0/holon-linux-amd64.tar.gz"
      sha256 "3ca7439e923436b564129521206f45eb5c95cfdfc739d64872f1a8aed1f52be8"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.60.0", shell_output("#{bin}/holon --version")
  end
end
