class Drdeploy < Formula
  desc "Post-deploy scanner for shipped websites — leaked keys, broken og:image, exposed .env"
  homepage "https://drdeploy.dev"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.4/drdeploy-darwin-arm64"
      sha256 "7a8314b960ba89b6fc6d14dfb20600cc17442bea4785a8fba95f46fc9de98e2b"
    end
    on_intel do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.4/drdeploy-darwin-x64"
      sha256 "e9f59b532ff256aec0b3a4c83f27d1cf55dbed81b95503bb078a97a1239f4a6b"
    end
  end

  on_linux do
    on_arm do
      on_64_bit do
        url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.4/drdeploy-linux-arm64"
        sha256 "80d0e3f1ceed2ef2b502841ed3138ab2a692a4f33b51cd8d2f73c8967f9f2e00"
      end
    end
    on_intel do
      url "https://github.com/Dr-Deploy/drdeploy/releases/download/%40drdeploy%2Fcli%400.1.4/drdeploy-linux-x64"
      sha256 "a8140ec86ce3a031bdbdc3f1101b9d095a13ddc148c98b32cfe1066edf71d7b6"
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
