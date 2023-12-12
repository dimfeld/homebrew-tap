class Sqlweld < Formula
  desc "Create SQL files from templates and partials"
  if Hardware::CPU.type == :arm
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.2.0/sqlweld-aarch64-apple-darwin.tar.gz"
    sha256 "e27e54c9beb833dad8fc4c67e380444e504f4018f16c8b47ed56a26824d14dbc"
  else
    url "https://github.com/dimfeld/sqlweld/releases/download/v0.2.0/sqlweld-x86_64-apple-darwin.tar.gz"
    sha256 "7f061dd077569d962bd769d8a6524826e700a2c1fbcda583eb0be9685ec61662"
  end
  version "0.2.0"
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
