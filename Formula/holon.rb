class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.52.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.52.0/holon-darwin-arm64.tar.gz"
      sha256 "02ce10347c25d8b5f56aedc026b50e88de5f376a20d2c4c247a95e117441e771"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.52.0/holon-darwin-amd64.tar.gz"
      sha256 "1c0fef9edaa5dfa84c60ba65d507c1f87f6e928c7c72e15b7a94f7114233769d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.52.0/holon-linux-amd64.tar.gz"
      sha256 "79fbb2b0162815039b872cc8f6f5339447ee5ef6c96ec097e15fc7b2b10aed6e"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/holon --version")
  end
end
