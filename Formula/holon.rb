class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.58.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.58.0/holon-darwin-arm64.tar.gz"
      sha256 "283c6869c7c68a6e771e0f0ed8fdeafbb0cb9fe8ac1eac291f0afc2165399451"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.58.0/holon-darwin-amd64.tar.gz"
      sha256 "ddcd164e5131ebf5dc5cb35f723fa0fc2fb38ca810497f26bb93dd1fbb7884bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.58.0/holon-linux-amd64.tar.gz"
      sha256 "0124d89fefaabfceafe17302960b1fd393c702778aeaa1775ea270b50df64347"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/holon --version")
  end
end
