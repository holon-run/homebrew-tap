class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.20.0/holon-darwin-arm64.tar.gz"
      sha256 "377f4109d30c152ca98bd814100398f2290b7ff0916a7501ce0c464222855aee"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.20.0/holon-darwin-amd64.tar.gz"
      sha256 "6ef6363a063c794450e00493f7fe8ffb235077b9048730d38c84acb83ad842b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.20.0/holon-linux-amd64.tar.gz"
      sha256 "49c585ab7125eaece9b103dcdda91c84b927d27eb59f7babcf632ff181ec231a"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/holon --version")
  end
end
