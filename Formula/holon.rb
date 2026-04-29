# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.12.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.12.0/holon-darwin-amd64.tar.gz"
      sha256 "2328b100783e6f4ff39878b113b0e040b3b075e8cf515e729a369d5c14a56a4d"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.12.0/holon-darwin-arm64.tar.gz"
      sha256 "ae0f78e3896c70981cf2802ee538b17deeacfb5ce488d9a80c651832bc44093f"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.12.0/holon-linux-amd64.tar.gz"
      sha256 "f27f245606b861926b08c3075235413806593af38ce420c66af92add926a623d"

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
