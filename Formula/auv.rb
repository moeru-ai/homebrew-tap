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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.26/auv-aarch64-apple-darwin.tar.gz"
    sha256 "ca6b1968da61f33f733e43f0b93372663ea8506244dc3729a0916c6ed6ab6061"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.26/auv-x86_64-apple-darwin.tar.gz"
    sha256 "fe403b97efeefbb2be99d33c3f16c99335d7d0c98472d5f84bdcd7bee321b2ec"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.26", shell_output("#{bin}/auv --version").strip
  end
end
