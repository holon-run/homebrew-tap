# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.11.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.11.0/holon-darwin-amd64.tar.gz"
      sha256 "ef8da9906e1eddcea302c48201e9f794fc99dab159bc2e8ecd4b50e09627d7b0"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.11.0/holon-darwin-arm64.tar.gz"
      sha256 "0d8298791f52147b20e44a162b7e4c1558cdff98fd2c5ddf77dce49ab200a49d"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.11.0/holon-linux-amd64.tar.gz"
      sha256 "706b022090492699e8e7e28c8870d082da60cb59617651dec74c0ba611ce9784"

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
