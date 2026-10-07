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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.30/auv-aarch64-apple-darwin.tar.gz"
    sha256 "07194c005a03442486c5c78546e8a7f81f8049c3de0063c721826cfde959f9e8"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.30/auv-x86_64-apple-darwin.tar.gz"
    sha256 "2dcf44e74e73e87665ce07396940b8bf14887eb6a9fb7f4ba48d7351b6c6037d"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.30", shell_output("#{bin}/auv --version").strip
  end
end
