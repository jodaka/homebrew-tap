class Tmail < Formula
  desc "Gmail-inspired, keyboard-first terminal email client backed by the Himalaya CLI"
  homepage "https://github.com/jodaka/tmail"
  version "0.8.8"

  livecheck do
    url :stable
    regex(/^tmail[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :github_latest
  end

  depends_on "himalaya"

  url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "5b929319b8422072ddcecd6910588d0f98c5012c5d91c3e473a9e906769414d9"

  on_macos do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "dc83d203e299e198640706720b50fe09441d8d0731a2d3c6e6b3a2d5a2fd5f80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4497386c5b961e3611f7737856e4642280286c9016f30f642a996b6c252692a"
    end
    on_arm do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5d7a913f366061fc01b384e814f526203c76b58a7edec624f5c79eca82d7785"
    end
  end

  def install
    bin.install "tmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmail --version")
  end
end
