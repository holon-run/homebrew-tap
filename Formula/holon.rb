class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.17.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.17.1/holon-darwin-arm64.tar.gz"
      sha256 "34faff7ba1e4056bdd75fccf038ae0bb7edb76fe86e9342e1845c4b92c3d1750"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.17.1/holon-darwin-amd64.tar.gz"
      sha256 "b7942f6c3842185160a341a0d4c35b39ac54735a4b9257b534afc7d739cddb29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.17.1/holon-linux-amd64.tar.gz"
      sha256 "0df564ab50d98b46bdfccc16b08ba926351e6e1e4774ebd95987e4f8ca1abfe4"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/holon --version")
  end
end
