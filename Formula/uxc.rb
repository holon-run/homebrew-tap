class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.4/uxc-v0.15.4-aarch64-apple-darwin.tar.gz"
      sha256 "c4a239687a33478649d0837de5c8205558327416483f0e9e4eca6623b9270de0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.4/uxc-v0.15.4-x86_64-apple-darwin.tar.gz"
      sha256 "151a91384425a3d77932e41062468fb360cac9f98a92351fb53c463dc7e296bf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.4/uxc-v0.15.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e774a5c24f77966d1d898979cbba4ef69ef9fb2ab0883e69d6c99e58a29cb866"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.4/uxc-v0.15.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f9e57d5a9b34ddb447bdda944be58b561756ca35330e5e164ba7c4d066975a52"
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
