class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.3.1/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "1d7da7817bd07511731bc2ec4fc3db5177196bc77cf7843c13b3334d7d039fc2"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.3.1/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "fe1fc5eb656a32d3727f490ce0eb7fd9961e38bd66df09abf89168007a01b64f"
  end
  version "0.3.1"
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
