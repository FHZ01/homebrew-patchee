class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  url "https://github.com/FHZ01/patchee/archive/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "patchee version #{version}", shell_output("#{bin}/patchee --version")
  end
end
