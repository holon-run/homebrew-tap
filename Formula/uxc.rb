class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.7.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.7.1/uxc-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "deafc121ac120ad12ad57f0bdd77c6867929a13e803bbc1150626e963c6b0165"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.7.1/uxc-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "544d83fe25c5931a8b71865b94172c0eca39af7e8273706c822fc8da70a6b254"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.7.1/uxc-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aeb3fb4ff4fa6276c30f4e0b995ae760bef173f3b6ffd7ac0241cc6c53ad04c4"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.7.1/uxc-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "628e46882624b660dc091dee760c9f1514ad97a5e00623ad77c02c1750f0ef36"
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
