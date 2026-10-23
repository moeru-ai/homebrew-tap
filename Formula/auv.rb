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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.38/auv-aarch64-apple-darwin.tar.gz"
    sha256 "398121a4dcbc4d5cf1650cbd75fa83f305c397e8b6d5f5be42d69c72f48c4574"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.38/auv-x86_64-apple-darwin.tar.gz"
    sha256 "f06f1489077c8bed5624bf7ede51c14671cd4e338f761f70ab9a9ee9256382a6"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.38", shell_output("#{bin}/auv --version").strip
  end
end
