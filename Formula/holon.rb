class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.34.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.34.2/holon-darwin-arm64.tar.gz"
      sha256 "4de2c7efe7076f63a7c4497f988c3d4488b87dbd5ed65e35a44ab091bded8a25"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.34.2/holon-darwin-amd64.tar.gz"
      sha256 "6e98c4f85d3abfd65e78bef441dac9ed452b75c29eb8b130c60da57e9aa04b21"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.34.2/holon-linux-amd64.tar.gz"
      sha256 "b5f9b391122cbbb3a0971d7b334dbe7db78cfc484e6ca0b67e9055dd61a89207"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.34.2", shell_output("#{bin}/holon --version")
  end
end
