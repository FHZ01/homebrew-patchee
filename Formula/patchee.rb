class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  url "https://github.com/FHZ01/patchee/archive/v1.0.0.tar.gz"
  sha256 "52734f5660f07219a02abaf72b7401b7aafd4b2dfc26e7879f99df921a474bc1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "patchee version #{version}", shell_output("#{bin}/patchee --version")
  end
end
