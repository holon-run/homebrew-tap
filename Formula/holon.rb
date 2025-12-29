# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.6.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.6.0/holon-darwin-amd64.tar.gz"
      sha256 "d094e5b2a76025472eabc2c8f59ab3adf04f75dcbef5c876cfe1c1a1cb7f93cc"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.6.0/holon-darwin-arm64.tar.gz"
      sha256 "db50d172fa1db517d573f82bb91abc7abd7d49596f87df465ea575e2b79309d9"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.6.0/holon-linux-amd64.tar.gz"
      sha256 "2b9416856afa1d7ecae8c40777f904ed887d685b1ad0cf84f63452554402b83b"

      def install
        bin.install "holon"
      end
    end
  end

  test do
    version_output = shell_output("\#{bin}/holon version")
    assert_match "holon version", version_output
    assert_match "commit:", version_output
    assert_match "built at:", version_output
  end
end
