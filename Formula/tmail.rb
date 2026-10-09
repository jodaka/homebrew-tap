class Tmail < Formula
  desc "Gmail-inspired, keyboard-first terminal email client backed by the Himalaya CLI"
  homepage "https://github.com/jodaka/tmail"
  version "0.8.9"

  livecheck do
    url :stable
    regex(/^tmail[._-]v?(\d+(?:\.\d+)+)[._-]/i)
    strategy :github_latest
  end

  depends_on "himalaya"

  url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "4f296e498fc61f8e1328b2ed88f16940cca9e670e3867df301a7d3a8fe824928"

  on_macos do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d3f8b98fce649621508bb942f9b0022a606a068808401214ba0b91538fe8e0cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b050794361a6b6af36aa8edeff06610eea523f37ee3193f12bff37844a90f0e6"
    end
    on_arm do
      url "https://github.com/jodaka/tmail/releases/download/v#{version}/tmail-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83022cf0a991d46b332f0c7276618cf556b937163f12e27313c5cbe4184ab981"
    end
  end

  def install
    bin.install "tmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmail --version")
  end
end
