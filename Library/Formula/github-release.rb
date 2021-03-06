class GithubRelease < Formula
  desc "Create and edit releases on Github (and upload artifacts)"
  homepage "https://github.com/aktau/github-release"
  url "https://github.com/aktau/github-release/archive/v0.5.3.tar.gz"
  sha1 "f2816cee7a9a0c7eea22ab5ae1d5a6aa1caefc5e"

  head "https://github.com/aktau/github-release.git"

  bottle do
    cellar :any
    sha1 "1ad266fc6c56b6631214785c764fee4e19aaeb4e" => :yosemite
    sha1 "31c085f718e68352a2b2f22f601512a1ba9adb65" => :mavericks
    sha1 "0e120d55f94ea274ead008610a86b46d478f41b7" => :mountain_lion
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "make"
    bin.install "github-release"
  end

  test do
    system "#{bin}/github-release", "info", "--user", "aktau",
                                            "--repo", "github-release",
                                            "--tag", "v#{version}"
  end
end
