class Uxc < Formula
  desc "Universal X-Protocol Call"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.1.1/uxc-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b4f6fa3795107c7957c83c96d546c90ed0d6e4bef7a58858f610526e03e0947a"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.1.1/uxc-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "f2a4acd60d05411eb55feaad81cbeb26d362062d6ba09babe2ded4d40d90e063"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.1.1/uxc-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed79bb7980dd46ad71dbe22ff9e0271a4baacd93146b6542aaa63d679aa3b74d"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.1.1/uxc-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1cf0772aaaa0d1fc376f889342ece262910037a7194f5201d1500bfb8660a959"
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
