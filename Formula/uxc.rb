class Uxc < Formula
  desc "Universal X-Protocol CLI"
  homepage "https://github.com/holon-run/uxc"
  license "MIT"
  version "0.12.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.4/uxc-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "4f486cfbc50c306c0c6b1b401aeb107f2335b9540f9ab4ad2d8819ab62b2b094"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.4/uxc-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "8143cdb427eb71f4c6b107e353d75f3ddf845cb0045a69a9d266e288cfc233df"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/uxc/releases/download/v0.12.4/uxc-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df4cb18f9d3f5791c10193fef79856a66e1a1e74fa6e1e1e979f2a298b500f75"
    else
      url "https://github.com/holon-run/uxc/releases/download/v0.12.4/uxc-v0.12.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2fa6f4d67208c5cccf168259c1e1cb852c7735f4ee5ab1221c2991babdf64a32"
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
