require "language/go"

class GitSizer < Formula
  desc "Compute various size metrics for a Git repository"
  homepage "https://github.com/github/git-sizer"
  url "https://github.com/github/git-sizer/archive/v1.0.0.tar.gz"
  sha256 "8ef6b2adb646ccb72f5ccfebd19a57371b119da1aac02ef06f1a46af6f7447a0"
  head "https://github.com/github/git-sizer.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/github").mkpath
    ln_sf buildpath, buildpath/"src/github.com/github/git-sizer"
    Language::Go.stage_deps resources, buildpath/"src"
    system "go", "build", "-o", bin/"git-sizer"
  end

  go_resource "github.com/spf13/pflag" do
    url "https://github.com/spf13/pflag.git",
        :revision => "e57e3eeb33f795204c1ca35f56c44f83227c6e66"
  end

  test do
    system "#{bin}/git-sizer", "-h"
  end
end
