class Patchee < Formula
  desc "CLI tool for AWS EC2 instance management and SSH connections"
  homepage "https://github.com/FHZ01/patchee"
  head "https://github.com/FHZ01/patchee.git", branch: "main"
  
  depends_on "go" => :build

  def install
    cd "cmd/patchee" do  # Change to the directory containing main.go
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  end

  test do
    system "#{bin}/patchee", "--version"
  end
end
