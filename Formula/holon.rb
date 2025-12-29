# typed: strict
# frozen_string_literal: true

class Holon < Formula
  desc "Standardized runner for AI-driven software engineering"
  homepage "https://github.com/holon-run/holon"
  license "MIT"

  version "0.5.0"

  # Auto-update configuration
  livecheck do
    url "https://github.com/holon-run/holon/releases/latest"
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.5.0/holon-darwin-amd64.tar.gz"
      sha256 "8a47b8ddc7e4423c141ea3a30ab76aa6c9b6831d2f82e58b9df06288f9ebeed5"

      def install
        bin.install "holon"
      end
    else
      url "https://github.com/holon-run/holon/releases/download/v0.5.0/holon-darwin-arm64.tar.gz"
      sha256 "2c102373b4ad602f6c5fa5b320e05c516ee5ebe8e5e050e33a9d0746fd907f4a"

      def install
        bin.install "holon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/holon-run/holon/releases/download/v0.5.0/holon-linux-amd64.tar.gz"
      sha256 "11092b680c47a04482e3141a554c3457d59c10e831049dc8b8112b3ce120c590"

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
