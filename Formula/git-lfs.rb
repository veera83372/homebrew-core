class GitLfs < Formula
  desc "Git extension for versioning large files"
  homepage "https://github.com/github/git-lfs"
  url "https://github.com/github/git-lfs/archive/v1.2.0.tar.gz"
  sha256 "daa0478095dc90423b8dbc934330fe50638a4c186959f8a8988bf9158cd1c54b"

  bottle do
    cellar :any_skip_relocation
    sha256 "bbb8aaf0e97563f364881b35fd83417dd4c9a4392a6bfbc6c5dccf7c829c364e" => :el_capitan
    sha256 "c0aee57b582b6847b4f1c5d9f9733e65131287a7e3d5a6570336ae7e98dbd452" => :yosemite
    sha256 "2094c00904df94816268e0d0ffac4952ff599c40888ba529ad9184e22f9d5396" => :mavericks
  end

  depends_on "go" => :build

  def install
    system "./script/bootstrap"
    bin.install "bin/git-lfs"
  end

  test do
    system "git", "init"
    system "git", "lfs", "track", "test"
    assert_match(/^test filter=lfs/, File.read(".gitattributes"))
  end
end
