class Dcmd < Formula
  desc "Per-folder command menu that puts the chosen command on your zsh prompt"
  homepage "https://github.com/karpikorop/zsh-dcmd-go"
  url "https://github.com/karpikorop/zsh-dcmd-go/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "b57a7b86f072768547e1a1669e77a9d85032847b1cc942b1e524a4e40944632d"
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
