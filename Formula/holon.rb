# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.9.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.9.0/holon-darwin-amd64.tar.gz"
      sha256 "ee66dbfebef02afcbcbcaeffadb151380bab55e9656826f566d520197a2563ff"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.9.0/holon-darwin-arm64.tar.gz"
      sha256 "edacba7821da75d28a46c6064fba79a34108bd8ba6382e4e0d0539aa0b4f4105"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.9.0/holon-linux-amd64.tar.gz"
      sha256 "01e9b9aaa93f9f8bcde1143a6d01bb8d1381c6bb596aac3c36c1b2602b899f77"

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
