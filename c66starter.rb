class C66starter < Formula
  desc "Cloud 66 Starter Brew"
  homepage "http://www.cloud66.com"
  url "https://github.com/cloud66/c66starter/archive/1.0.2.tar.gz"
  version "1.0.2"
  sha256 "8fcc70bdfe472f9ef1d367e3e4928a7cb4d379c6563fb43fd6a3fedf6df344e2"

  def install
    bin.install "starter"
  end

  test do
    system "starter help"
  end
end
