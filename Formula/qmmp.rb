class Qmmp < Formula
  desc "Qt-based Multimedia Player"
  homepage "http://qmmp.ylsoftware.com/"
  url "http://qmmp.ylsoftware.com/files/qmmp-1.2.2.tar.bz2"
  sha256 "e9dc5723f7f2a04d36167585ce1b4223c09f36c6dad1215de877dc51d1f3d606"
  head "http://svn.code.sf.net/p/qmmp-dev/code/branches/qmmp-1.2/"

  bottle do
    sha256 "a04d42f4f3baa02d04cae3038de05335c283c0522f78f7272faa257d07c39d12" => :mojave
    sha256 "02d2a232d361540ed0409a7a50a956dc21bb6f4600294d32eb470bfdb3d54706" => :high_sierra
    sha256 "882c14825528f2b25470bf3135da753c181c5ec1b55c9273b1d037d729427aea" => :sierra
    sha256 "afa299bffaf451023279305dce294d41a922242cc141d8c1ec8dda3200507d74" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "faad2"
  depends_on "ffmpeg"
  depends_on "flac"
  depends_on "libbs2b"
  depends_on "libmms"
  depends_on "libogg"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libsoxr"
  depends_on "libvorbis"
  depends_on "mad"
  depends_on "mplayer"
  depends_on "musepack"
  depends_on "opus"
  depends_on "opusfile"
  depends_on "qt"
  depends_on "taglib"

  def install
    system "cmake", "./", "-USE_SKINNED", "-USE_ENCA", "-USE_QMMP_DIALOG", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"qmmp", "--version"
  end
end
