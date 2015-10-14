class C66starter < Formula
  desc "Cloud 66 Starter Brew"
  homepage "http://www.cloud66.com"
  url "https://github.com/cloud66/c66starter/archive/1.0.1.tar.gz"
  version "1.0.1"
  sha256 "cb979db1e5f3e886d4dc2489ad23a4dddf265619138780ee0b84f7665047070c"

  def install
    bin.install "starter"
  end

  test do
    system "starter help"
  end
end
