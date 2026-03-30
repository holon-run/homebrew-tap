class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.7"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "2c9f84aaead42b37c7ef8b5ec2296e022a252de59f0c4e092f2800db4b991f46"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "62d8008366b6f2ffb34305925cdc22aa692c72aa3759a900bc926d222e8273a4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfcf086f9c590ba43a4d5581e035ccad7849f175848b1fdd5ad4ee3bf5f6e989"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.7/uxc-v0.12.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c05b41c8b0561f018cc0ee551ffedab392ea9707a5b328728c5d9fba5e011a98"
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
