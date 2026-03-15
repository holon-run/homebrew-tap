class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.0/uxc-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "d083413c581f9cf12bee675cfd2fc3fc3a9f0bfbb8c11bdee026ed271ae9d9d7"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.0/uxc-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "39091f35b706c7bd061d3ced776b444245f375d965112cf2a9623b3c401b9d59"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.0/uxc-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d305fa2989cd05839399f11b86feabd6851d307b652e11429a89145a8eeff4f0"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.0/uxc-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1f836a5974045e1406259698243336c0bac00ec79177fdd4ff3cd92a42dd7cae"
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
