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
  # TODO(homebrew-release-update): Keep URL and checksum updates manual until
  # an owner-approved stable-release workflow can verify both macOS archives.
  if Hardware::CPU.arm?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.24/auv-aarch64-apple-darwin.tar.gz"
    sha256 "bb842874f8b6513d14df279c2743054b003bfe8e68f8839ac1b3e814df56a3fe"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.24/auv-x86_64-apple-darwin.tar.gz"
    sha256 "592d74b8a893182f096c0ad7546f8ceeaddc44ed6786f23e0a12780de21fc571"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.24", shell_output("#{bin}/auv --version").strip
  end
end
