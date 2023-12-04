class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.2/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "e36e78b83cf90290e30225fe102d31c877d6586ecbbb139cc97e4bc1d8c2b028"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.2/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "2814b7b19aa3c3c5f90d9b1ff9806a35aa6685784eb0ee6696bfbfdadab5c0f6"
  end
  version "0.1.2"
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
