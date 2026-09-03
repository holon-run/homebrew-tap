class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.36.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.36.0/holon-darwin-arm64.tar.gz"
      sha256 "f93cd591e8da153b57617cf75f139ef7f4fa777785af2d01a527c72dd68681c8"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.36.0/holon-darwin-amd64.tar.gz"
      sha256 "a3c12705b93544483d1ba7eed4cbee9eab39121d3f700952e1397802bbb83dfd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.36.0/holon-linux-amd64.tar.gz"
      sha256 "1f99c46962dba3c775c12a6e93b346630f954995fde892a4a0fab42197d3b3b2"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/holon --version")
  end
end
