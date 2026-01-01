# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.8.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.8.0/holon-darwin-amd64.tar.gz"
      sha256 "7e45ce015c7294e37f9d2d3bcc7ac03d4ad868d891731adc6ead532d7e72abd5"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.8.0/holon-darwin-arm64.tar.gz"
      sha256 "ec327dcf04b510dbd0f2eb0738f0f12494bb932cb38ae4c72c7112c566a9cc93"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.8.0/holon-linux-amd64.tar.gz"
      sha256 "af5b4fddebe2567fc68a202a4329fc1581b0ad3b30de4a9db11d4e39585a43d9"

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
