class Torrentcheck < Formula
  desc "Command-line torrent viewer and hash checker"
  homepage "https://torrentcheck.sourceforge.io/"
  url "https://github.com/JrMasterModelBuilder/homebrew-torrentcheck/releases/download/sources/torrentcheck-1.00.zip"
  version "1.00"
  sha256 "a839f9ac9669d942f83af33db96ce9902d84f85592c99b568ef0f5232ff318c5"

  def install
    inreplace "torrentcheck.c", "#include <malloc.h>", ""
    ENV.append "CFLAGS", "-Wno-implicit-function-declaration"
    system ENV.cc, "torrentcheck.c", "sha1.c", "-o", "torrentcheck", *ENV.cflags.to_s.split
    bin.install "torrentcheck"
  end
end
