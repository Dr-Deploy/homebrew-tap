class Drdeploy < Formula
  desc "Post-deploy scanner for shipped websites — leaked keys, broken og:image, exposed .env"
  homepage "https://drdeploy.dev"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.5/drdeploy-darwin-arm64"
      sha256 "1d5c1243f5d7e5d4a86d74e862d6141738ccae8e028f958b44f529b771b1db4f"
    end
    on_intel do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.5/drdeploy-darwin-x64"
      sha256 "c165e388bb652a21455f1e3d6ed1e42799b8cee0cfb433b58ebf59c06a83f146"
    end
  end

  on_linux do
    on_arm do
      on_64_bit do
        url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.5/drdeploy-linux-arm64"
        sha256 "bc7a43048494cd4785744dac73e68c660fb4dc73a36e8d3b4fa7b3318b0fdf58"
      end
    end
    on_intel do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.5/drdeploy-linux-x64"
      sha256 "8c92c77f698cf926c86f3d4e090cbfbf4f73317c01dbb3c4785f3fbb6a9a100a"
    end
  end

  def install
    # Each platform downloads ONE file named drdeploy-{os}-{arch}. Glob it
    # and install as `drdeploy`. Single-binary install — no man pages,
    # completions, or other artifacts in v0.1.
    binary = Dir["drdeploy-*"].first
    odie "drdeploy binary not found in tarball" if binary.nil?
    bin.install binary => "drdeploy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drdeploy --version")
  end
end
