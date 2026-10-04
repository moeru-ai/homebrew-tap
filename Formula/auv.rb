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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.28/auv-aarch64-apple-darwin.tar.gz"
    sha256 "53021e70d9356ad8add460930010be34d838a4f3eb425e59cd7651a74c9a6d0d"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.28/auv-x86_64-apple-darwin.tar.gz"
    sha256 "0f24c9912c5aca6b1ae5d4de7391d4313d57a493adce02535be0b93e7079944c"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.28", shell_output("#{bin}/auv --version").strip
  end
end
