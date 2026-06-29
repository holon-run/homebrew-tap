class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.24.0/holon-darwin-arm64.tar.gz"
      sha256 "ece70e665f364adbb9b3a1450ec89b3bce4b94682c195475bb1fccfca5640819"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.24.0/holon-darwin-amd64.tar.gz"
      sha256 "b22572cd56f4cd5395b9906dc82a07b0cd87efc608bf9e737e5bb41301f1fb65"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.24.0/holon-linux-amd64.tar.gz"
      sha256 "2752b26d90e01a9ca5733160b977b034ff579348332da54590d1ed3a410a254c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/holon --version")
  end
end
