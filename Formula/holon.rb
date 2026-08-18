class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.32.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.32.0/holon-darwin-arm64.tar.gz"
      sha256 "59f794909b78c1b7da7b28c5ee52990361480592a5f9e948ec49eb4e2bcc47d7"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.32.0/holon-darwin-amd64.tar.gz"
      sha256 "1d51d22cd506fc051b5ee28324aeb7ec0adfef5b47a2ec69824a0aed66a3775e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.32.0/holon-linux-amd64.tar.gz"
      sha256 "2a09f50d6fadc47f420f0271d5bae9b5c51cfb2aa23ebfad4ccb7ffa50641c79"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/holon --version")
  end
end
