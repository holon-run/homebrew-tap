class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.18.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.18.1/holon-darwin-arm64.tar.gz"
      sha256 "864c5735ad00709df9b3742c913513fdf712563f95e9b1f416d55234f9ca5109"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.18.1/holon-darwin-amd64.tar.gz"
      sha256 "a2235c2ca030ae7031a6fb8b989b53465ac4e0cae7c3e31ca2e1a813c9f76ae4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.18.1/holon-linux-amd64.tar.gz"
      sha256 "855507fd406b571f9f67264188b31e321c3668580ce1d009984fbb8ec903c0ec"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.18.1", shell_output("#{bin}/holon --version")
  end
end
