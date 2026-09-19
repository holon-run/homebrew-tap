class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.44.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.44.1/holon-darwin-arm64.tar.gz"
      sha256 "20e4d2f09539e1b91155b9b13c7397e0167900cafe6efce084dfd3b273c41002"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.44.1/holon-darwin-amd64.tar.gz"
      sha256 "c91c08c60560d3d21730fa4b9a8d2e0944f281c62eeef821d5156c0379d15e0a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.44.1/holon-linux-amd64.tar.gz"
      sha256 "ed519183705df5947c74143b75233f80872c1adb1684b3d328f4390b7fc8f752"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.44.1", shell_output("#{bin}/holon --version")
  end
end
