class Tmail < Formula
  desc "Gmail-inspired, keyboard-first terminal email client backed by the Himalaya CLI"
  homepage "https://github.com/jodaka/tmail"
  version "0.6.3"

  livecheck do
    url :stable
    regex(/^tmail[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :github_latest
  end

  depends_on "himalaya"

  url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "cc51ed7061c8f1eb5d3a5a006d7b82c5c60fd584f48735b46cbe21780a24ab6d"

  on_macos do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0c8f2ab64c497cc52717f61e9551692afd784eba2f55d5a36162749300d4eb93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d8439cf8df1df1cdb832b2c10820602180a3b3de18f22bbaae1f427246e440a"
    end
  end

  def install
    bin.install "tmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmail --version")
  end
end
