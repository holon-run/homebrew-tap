# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.7.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.7.0/holon-darwin-amd64.tar.gz"
      sha256 "d27d156160ff316c70b82d987243ec3e13e967ea6cad9bafe5777b57eb0b1f99"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.7.0/holon-darwin-arm64.tar.gz"
      sha256 "a2646a7ae931d3d271215039b39e7ac5b3387117db3c109f7a82555beb836073"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.7.0/holon-linux-amd64.tar.gz"
      sha256 "d284f1ce9be18fb09decd9d50998ac319fb084973d263a0d662ab56b4336d084"

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
