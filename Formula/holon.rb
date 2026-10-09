class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.49.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.49.0/holon-darwin-arm64.tar.gz"
      sha256 "c62e69b0c8baf5894f5ef9e7085448f5442b80a3937ee305b5bba5dbbdad14d0"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.49.0/holon-darwin-amd64.tar.gz"
      sha256 "2b8e89704e2a2cedf7b82b0dc6f47ae99b4cd98d34b6d892634c261f2e118612"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.49.0/holon-linux-amd64.tar.gz"
      sha256 "c617fb2734b773a04f7c21903ec1310d73bb9cefc738c07e5697069daaaf988c"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/holon --version")
  end
end
