class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.61.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.61.1/holon-darwin-arm64.tar.gz"
      sha256 "b08062cebdae97ccd600438451327976251733b910864071565ed02ba08c211a"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.61.1/holon-darwin-amd64.tar.gz"
      sha256 "190a1d344f4da7701fb86592251f502ccfa8571a346ac2785ea50f1bc5792938"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.61.1/holon-linux-amd64.tar.gz"
      sha256 "7a77cda152b3e7acad5c7faaa540a147a4cf1c415d173f902167272eec9923af"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.61.1", shell_output("#{bin}/holon --version")
  end
end
