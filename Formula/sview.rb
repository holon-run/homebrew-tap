class Sview < Formula
  desc "Agent-friendly structure views of source and document files"
  homepage "https://github.com/holon-run/sview"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/sview/releases/download/v0.1.3/sview-darwin-arm64.tar.gz"
      sha256 "4fb07db347fb5ad0ac2b550ec8c042b02ee59ffd7e96d35e061c54e2d5e96106"
    else
      url "https://github.com/holon-run/sview/releases/download/v0.1.3/sview-darwin-amd64.tar.gz"
      sha256 "7068820e8ae3a662a14665c6dc029f535da36eb84b35162905db9dfaaf60e6e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/sview/releases/download/v0.1.3/sview-linux-amd64.tar.gz"
      sha256 "4cc5c7767bb89e8fa1bdf56418a9cef7660a39ee6fdbebd0cad449837524cf5b"
    else
      odie "sview does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "sview"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/sview --version")
  end
end
