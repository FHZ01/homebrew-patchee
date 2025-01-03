class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  url "https://github.com/FHZ01/patchee/archive/v1.0.0.tar.gz"
  sha256 "0761161eda4aaea36d9a34ea07ed1342e0a154abd15a4f2253b0cb2aac6adcd8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "patchee version #{version}", shell_output("#{bin}/patchee --version")
  end
end
