class Sview < Formula
  desc "Agent-friendly structure views of source and document files"
  homepage "https://github.com/holon-run/sview"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/sview/releases/download/v0.1.2/sview-darwin-arm64.tar.gz"
      sha256 "28eba6d3dc217b0f460309f145ffb044dd9e4ae83045bc0d1358fb8c7806865c"
    else
      url "https://github.com/holon-run/sview/releases/download/v0.1.2/sview-darwin-amd64.tar.gz"
      sha256 "2b80a2346ea3d9f5ac2e95c5faa62a68df072e3f24d4b8d02dd5d1f6251f221d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/sview/releases/download/v0.1.2/sview-linux-amd64.tar.gz"
      sha256 "d63082f5006649d64c88a8da5a53875ede4ac3a5af8c3b8cda82a12d2c9e974b"
    else
      odie "sview does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "sview"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/sview --version")
  end
end
