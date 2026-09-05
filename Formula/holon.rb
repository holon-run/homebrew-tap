class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.37.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.37.0/holon-darwin-arm64.tar.gz"
      sha256 "9042087f015342959cadf619feb5f189edc8a8626517e9612441882b39957cac"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.37.0/holon-darwin-amd64.tar.gz"
      sha256 "50240af080f736b7d9f0b16fa10a86ad637708776e6739b3dba486d7627508c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.37.0/holon-linux-amd64.tar.gz"
      sha256 "dff50b5b0e2ad70139f36d50577257f35e40d8d5d591720a8de97030ec493072"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/holon --version")
  end
end
