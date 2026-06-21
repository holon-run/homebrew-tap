class Sview < Formula
  desc "Agent-friendly structure views of source and document files"
  homepage "https://github.com/holon-run/sview"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/sview/releases/download/v0.1.1/sview-darwin-arm64.tar.gz"
      sha256 "1b5117f07e1d8591e84873ab89f2ac7fd35cbb9ed1de23fb27978ae2a8d89435"
    else
      url "https://github.com/holon-run/sview/releases/download/v0.1.1/sview-darwin-amd64.tar.gz"
      sha256 "bba4532338a8b42febd376de5458f380da770a6f01789a500f60fd37fc41f1e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/sview/releases/download/v0.1.1/sview-linux-amd64.tar.gz"
      sha256 "c86ba8584bfaaf96ea771248c34c17b12432d820eedbd0c683dfbab576a6e996"
    else
      odie "sview does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "sview"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/sview --version")
  end
end
