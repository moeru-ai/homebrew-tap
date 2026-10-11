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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.33/auv-aarch64-apple-darwin.tar.gz"
    sha256 "de9161528e1c3c9e0caac90753bafee9b53ee99eea0e8dc7594bd4d4f5e10368"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.33/auv-x86_64-apple-darwin.tar.gz"
    sha256 "3fa101a03be64bd36850f8f1dd55a315d73d50c7ba900a40a1407fb617ab72dd"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.33", shell_output("#{bin}/auv --version").strip
  end
end
