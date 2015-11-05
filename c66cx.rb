class C66cx < Formula
  desc "Cloud 66 CX Toolbelt Brew"
  homepage "http://www.cloud66.com"
  url "https://github.com/cloud66/c66cx/archive/0.1.32.tar.gz"
  version "0.1.32"
  sha256 "2fefe60250777f7f50738200845981110b2beae871d1fc2b84b0f90058e7fc3d"

  def install
    bin.install "cx"
  end

  test do
    system "cx help"
  end
end
