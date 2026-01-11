# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.10.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.10.0/holon-darwin-amd64.tar.gz"
      sha256 "6c7b7a4aab8cc61f2ef61e8508af8734bcf09a4257d13b5d24fe35463742e0a4"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.10.0/holon-darwin-arm64.tar.gz"
      sha256 "fd4057436f10705e668a2bbc46e57e7c7fdf5372b470cb237e38add28b023a13"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.10.0/holon-linux-amd64.tar.gz"
      sha256 "2d08260beacc59a0f48f067b338e51ebe2e2f70738a07f4906b442478e03788c"

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
