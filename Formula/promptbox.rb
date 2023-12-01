class Promptbox < Formula
  desc "A CLI tool for managing and executing LLM prompt templates"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.1/promptbox-aarch64-apple-darwin.tar.gz"
    sha256 "08d4a76f7bb23cb6fa6a74ecc9c248f50974a7bd3b1f80635d92eb7703120fe9"
  else
    url "https://github.com/dimfeld/promptbox/releases/download/v0.1.1/promptbox-x86_64-apple-darwin.tar.gz"
    sha256 "1535f5aff7c31eb37809478413e30ddb92625405bb2a18f1e1bbb4fb5fd1e613"
  end
  version "0.1.1"
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
