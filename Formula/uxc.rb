class Uxc < Formula
  desc "Universal X-Protocol Call"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.3.0/uxc-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "9236eaaef17d9d6bcf483577accad3393bc1c6dafc02debf1432f61ad59b2366"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.3.0/uxc-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "07992509712d0901f3685141bab7d115dbb9330345cd9519633ee52935185382"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.3.0/uxc-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb8b9fa90691d6b726e61dc4e13ee5d389d47453d49e851341f755c8ee55b528"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.3.0/uxc-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd97a4f5033379f6f023fc10f5021d8ad315920c5337018a7c830b93eb931212"
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
