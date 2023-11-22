class Sqlweld < Formula
  desc "Create SQL files from templates and partials"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.5/sqlweld-aarch64-apple-darwin.tar.gz"
    sha256 "58ebd6cd23cce3b3c9f72cfb4f880ac43bb5921d8f952f3f5d34e452337c015f"
  else
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.5/sqlweld-x86_64-apple-darwin.tar.gz"
    sha256 "3458829f15f5e97b57a8c1801e051a8282c89980b9b2230401e04379d020cbdb"
  end
  version "0.1.5"
  license "MIT OR Apache-2.0"

  def install
    bin.install "sqlweld"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
