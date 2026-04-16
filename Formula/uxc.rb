class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.15.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.2/uxc-v0.15.2-aarch64-apple-darwin.tar.gz"
      sha256 "b56f180f4dbb5091dc2907dd677ea5850c23dd5a04b96bb7db537a6838bf3b04"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.2/uxc-v0.15.2-x86_64-apple-darwin.tar.gz"
      sha256 "b65ea62d9db8808cbc89c735fe7fa047d51f84d9aaffbeb4594e92d31c635d9e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.15.2/uxc-v0.15.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e11360ff5d9c5a8bc45adc13ecf56b183bcfeaa40c8d77b61362b20b40a90f53"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.15.2/uxc-v0.15.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ab54f8d95d1f7ab5b9025f8c105914344a841f1fa64294d3711396cc5605728"
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
