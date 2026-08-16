class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.31.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.31.1/holon-darwin-arm64.tar.gz"
      sha256 "f6045a5aa82482f411474498352281dc2d20fb86eeafb2f08dae48b03df31f1a"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.31.1/holon-darwin-amd64.tar.gz"
      sha256 "660346ab814ff01f42e10d70c27fbb53e08b99fe019a5fdfffe67f86c4530082"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.31.1/holon-linux-amd64.tar.gz"
      sha256 "c45490bf777fe62ff2f88ca1c049034bf005a39186e897a43363bd74726e5047"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.31.1", shell_output("#{bin}/holon --version")
  end
end
