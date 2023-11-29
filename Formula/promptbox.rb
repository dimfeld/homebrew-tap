class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.0/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "672c64bb02f55a976ed7af9de7a0cffcf874fba77311294cb4f56c29d4a12dea"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.0/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "83afd02e57bd1e6ed26ed46fa199f796f84c1e85d136de272bcf47b6134cc425"
  end
  version "0.1.0"
  license "MIT OR Apache-2.0"

  def install
    bin.install "promptbox"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
