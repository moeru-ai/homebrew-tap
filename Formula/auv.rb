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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.39/auv-aarch64-apple-darwin.tar.gz"
    sha256 "763748348d81b701638518f66bb11ab3717884c18e66980d33e44259970cf995"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.39/auv-x86_64-apple-darwin.tar.gz"
    sha256 "eba106a9f8cd42f9afce9b1581dff7c83a79f12d6e5d09f2e55fa82118834529"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.39", shell_output("#{bin}/auv --version").strip
  end
end
