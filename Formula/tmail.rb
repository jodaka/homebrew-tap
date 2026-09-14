class Tmail < Formula
  desc "Gmail-inspired, keyboard-first terminal email client backed by the Himalaya CLI"
  homepage "https://github.com/jodaka/tmail"
  version "0.3.2"

  livecheck do
    url :stable
    regex(/^tmail[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :github_latest
  end

  depends_on "himalaya"

  on_macos do
    on_arm do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "93974559996e9cabc72401f41c51ad1126c375b4110730a846ca3f65fdd1b7b3"
    end
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c66a74038ae8087e40e2c081e5381b4dac45bf0bd8c16aa1bd4cd8c5d11689aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53c9ce0e157a6792c0dd14ec22a4f6a7e04eee7e1fc7a2abafdcf17d627d6de1"
    end
  end

  def install
    bin.install "tmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmail --version")
  end
end
