class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.13.0/holon-darwin-arm64.tar.gz"
      sha256 "b74d3209e80fd38947c386187d6ab1d969f5aab2cfa78168800af1f6371997a7"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.13.0/holon-darwin-amd64.tar.gz"
      sha256 "a4d314a69962ffdfa1971bb639de0ff850ff0df89b14a5f68ab0fbb30898edd9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.13.0/holon-linux-amd64.tar.gz"
      sha256 "e25e2a53a24221dd246e1b954825da987356b0ca4c5abf2c5ecd969060a84055"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/holon --version")
  end
end
