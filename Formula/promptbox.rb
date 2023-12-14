class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.3.0/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "986c4a814d5a8250d6cd5d8a5b699da04ff9cbb19af49f35f195b887928666cd"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.3.0/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "3cea726d70b63f317c342b7a66d004ca2a303e361b357be657871006ce6cf92e"
  end
  version "0.3.0"
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
