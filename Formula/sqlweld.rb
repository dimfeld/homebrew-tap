class Sqlweld < Formula
  desc "Create SQL files from templates and partials"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.3/sqlweld-aarch64-apple-darwin.tar.gz"
    sha256 "4ce623290c51e12d9538235753752fdc27d17eadd40551306086b63597fe3307"
  else
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.3/sqlweld-x86_64-apple-darwin.tar.gz"
    sha256 "a731c92e0c3f81aa5531d3a187147458e8ab2df80253ef04238e76bb9f2a03ff"
  end
  version "0.1.3"
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
