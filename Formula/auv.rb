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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.31/auv-aarch64-apple-darwin.tar.gz"
    sha256 "a4f2223a1872063ae22a0f2070d043707dab4d5b13810e06d3202a6c96c63c17"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.31/auv-x86_64-apple-darwin.tar.gz"
    sha256 "cd8a938169db9a00a1b0338dee8da0d6d82201f2fa03b954c262cbf1ff74a8a5"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.31", shell_output("#{bin}/auv --version").strip
  end
end
