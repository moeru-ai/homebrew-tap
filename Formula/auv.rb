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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.32/auv-aarch64-apple-darwin.tar.gz"
    sha256 "c5668d6de26cdcd9ea7d6f8c68f1f8be36c5cb12ec554d81ecf725e2bea45636"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.32/auv-x86_64-apple-darwin.tar.gz"
    sha256 "eca166c5654917956e10e990a2770e902e17cb820534bec6f66083d4ec5d9a95"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.32", shell_output("#{bin}/auv --version").strip
  end
end
