class Tmail < Formula
  desc "Gmail-inspired, keyboard-first terminal email client backed by the Himalaya CLI"
  homepage "https://github.com/jodaka/tmail"
  version "0.9.1"

  livecheck do
    url :stable
    regex(/^tmail[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :github_latest
  end

  depends_on "himalaya"

  url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "538dafb37527adf9357c5315b3a2ce9b06b57250bc592f75e4ecb7bc517c352d"

  on_macos do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2eb004702916a43360dfe42ef21cd692537963e3cf0ad7880d057c58fb301ed2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f41419b08790d25ff141236e2026be7ac971e195df3937b9518558e2cf470b5f"
    end
    on_arm do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53fd32a26054de632edde4608395f43f18743949b5b4e528fc0c18f427abbdb9"
    end
  end

  def install
    bin.install "tmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmail --version")
  end
end
