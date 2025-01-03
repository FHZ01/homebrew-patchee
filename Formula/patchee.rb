class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  url "https://github.com/FHZ01/patchee/archive/v1.0.0.tar.gz"
  sha256 "79767388f45f16d1114c28e85ca3a08960c8763587ff2b66176d08f790b735d3"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "patchee version #{version}", shell_output("#{bin}/patchee --version")
  end
end
