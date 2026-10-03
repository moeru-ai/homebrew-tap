class Auv < Formula
  desc "Invoke and inspect core computer-use capabilities"
  homepage "https://github.com/moeru-ai/auv"
  license "Apache-2.0"

  # TODO(homebrew-linux): Linuxbrew is deferred until both Linux artifacts have
  # tap-side installation evidence and an owner-approved support slice.
  depends_on :macos

  # NOTICE: Homebrew loads tap formulae under Linux architecture contexts
  # during validation. Select the archive by CPU here; the macOS requirement
  # rejects Linux installation before it can use this URL.
  if Hardware::CPU.arm?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.25/auv-aarch64-apple-darwin.tar.gz"
    sha256 "888a8c84d023af466552116578a2a03fcc6b55aaf83ed69a145ff3c78cde0127"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.25/auv-x86_64-apple-darwin.tar.gz"
    sha256 "11d086d5d55900853bb7c2e74e2f07c798f82407c29d6ec825bd9b0d03f13314"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.25", shell_output("#{bin}/auv --version").strip
  end
end
