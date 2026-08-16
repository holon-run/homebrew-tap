class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.31.0/holon-darwin-arm64.tar.gz"
      sha256 "1d28d8e1073c13eab2b14d5fb6e94627d8e0b4ba0131326ec2eeb448efb45c6b"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.31.0/holon-darwin-amd64.tar.gz"
      sha256 "fe04da8fdef68ac9ec6565938f71620a73c564bc71d1687f3f100744a665b310"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.31.0/holon-linux-amd64.tar.gz"
      sha256 "19d16d876233f83a2d0e53b557c999ccdd724add1a808a768fd7e017eb5fad2f"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/holon --version")
  end
end
