class Sview < Formula
  desc "Agent-friendly structure views of source and document files"
  homepage "https://github.com/holon-run/sview"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/sview/releases/download/v0.1.4/sview-darwin-arm64.tar.gz"
      sha256 "52863088d7b429f81e50c8db3a16e06474bb06d37e886f50ad8f5687135599fd"
    else
      url "https://github.com/holon-run/sview/releases/download/v0.1.4/sview-darwin-amd64.tar.gz"
      sha256 "38bd21e8d7ba44469751ca920ced487228c3635a09805a48df7b8887777071dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/sview/releases/download/v0.1.4/sview-linux-amd64.tar.gz"
      sha256 "006cf35f23dd0e477338ea6b5276a87f93edce086993509bf7bb4c857db8beff"
    else
      odie "sview does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "sview"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/sview --version")
  end
end
