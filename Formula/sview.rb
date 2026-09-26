class Sview < Formula
  desc "Agent-friendly structure views of source and document files"
  homepage "https://github.com/holon-run/sview"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/sview/releases/download/v0.1.5/sview-darwin-arm64.tar.gz"
      sha256 "7d1dbd8128b4d932229792ea6937ca4c938b3c2e29002aa6eda26154171df299"
    else
      url "https://github.com/holon-run/sview/releases/download/v0.1.5/sview-darwin-amd64.tar.gz"
      sha256 "8248b848ac680879d6de3af74394fa754e6d59119c88c813fc7a80b3dc2eb3b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/sview/releases/download/v0.1.5/sview-linux-amd64.tar.gz"
      sha256 "5ca9398decbcfd6585c5801e855c6ebea2782b71de9434c893f8f1b223fd72c9"
    else
      odie "sview does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "sview"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/sview --version")
  end
end
