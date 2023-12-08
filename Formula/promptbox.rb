class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.2.0/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "4fe94af15b364a37ed3e231920f5950e31c431a66e9b19c3ca0b3ecc0e667fa8"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.2.0/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "b4d594f8c85604f0ab54cb7e8fae54d304837cd30ee4bcdd66d36285f39bf7e4"
  end
  version "0.2.0"
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
