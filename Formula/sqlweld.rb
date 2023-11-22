class Sqlweld < Formula
  desc "Create SQL files from templates and partials"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.4/sqlweld-aarch64-apple-darwin.tar.gz"
    sha256 "f29753bb85f376ecf58240b06c4982ce561de85ebdad1c8436427311b3ac678d"
  else
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.1.4/sqlweld-x86_64-apple-darwin.tar.gz"
    sha256 "2caf5a8515af53cd6a1b2aa8484d613f3adc8c46619f4d3e7fe31945e1fb0c51"
  end
  version "0.1.4"
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
