# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class C66starter < Formula
  desc "Cloud 66 Starter Brew"
  homepage "http://www.cloud66.com"
  url "https://github.com/cloud66/c66starter/archive/1.0.0.tar.gz"
  version "1.0.0"
  sha256 "3b4b58858b6c886c05be3c25b8d4c3743a4481bfc253deb8fbef4e586010c98d"

  def install
    bin.install "starter"
  end

  test do
    system "starter help"
  end
end
