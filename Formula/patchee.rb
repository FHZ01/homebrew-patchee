class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  url "https://github.com/FHZ01/patchee/archive/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "patchee version #{version}", shell_output("#{bin}/patchee --version")
  end
end
