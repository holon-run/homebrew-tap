class Holon < Formula
  desc "Headless, event-driven runtime for long-lived agents"
  homepage "https://github.com/holon-run/holon"
  version "0.14.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holon-run/holon/releases/download/v0.14.1/holon-darwin-arm64.tar.gz"
      sha256 "db39dc14c89f9184957f4fc771a2a80a62d191a47da5cd67cfc0f2d070cde0a3"
    else
      url "https://github.com/holon-run/holon/releases/download/v0.14.1/holon-darwin-amd64.tar.gz"
      sha256 "0663ebde1ebd4696753d7713e303f24dad8dd12e0a10231fd0d72d4b22eb44d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.14.1/holon-linux-amd64.tar.gz"
      sha256 "0ab0df44ca83ad534a71796c1dadba01e52874386eeeef9332d665f0f731ce0e"
    else
      odie "Holon does not publish a Linux ARM64 binary yet"
    end
  end

  def install
    bin.install "holon"
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/holon --version")
  end
end
