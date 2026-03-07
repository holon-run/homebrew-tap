class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.9.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.9.0/uxc-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "7767f77278b8b2f2259f536302a5cf187a6ec96b7f45eb03efd2cf527f7a8a62"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.9.0/uxc-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "55c47acf17edd2f4aefede94df62cda97ee2fe9bf2235d88bd5a338eb8419534"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.9.0/uxc-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae98ac0f312d85ad2ba09dca04cd0cd728056b501832c7e48f26785422eb09a6"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.9.0/uxc-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd4be44bff7ca24a391a379eacf18633c2dc87dfd25aa789073d8b09f22eaaa5"
    end
  end

  def install
    bin.install "uxc"
  end

  test do
    output = shell_output("#{bin}/uxc --version")
    assert_match version.to_s, output
  end
end
