class Dcmd < Formula
  desc "Per-folder command menu that puts the chosen command on your zsh prompt"
  homepage "https://github.com/karpikorop/zsh-dcmd-go"
  url "https://github.com/karpikorop/zsh-dcmd-go/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "99cf7f15a3b7f12a3d1f3abf5529fb267edf732b012d068bb2f9a9b09485b770"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/dcmd"
  end

  def caveats
    <<~EOS
      Add this line to your ~/.zshrc:
        eval "$(dcmd init zsh)"
    EOS
  end

  test do
    assert_match "dcmd()", shell_output("#{bin}/dcmd init zsh")
  end
end
