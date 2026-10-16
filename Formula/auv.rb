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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.35/auv-aarch64-apple-darwin.tar.gz"
    sha256 "cc23f6a9b7d6bd8692f1d775e230bde0a9bfedb99303b78d1ef1d8c829a9bc02"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.35/auv-x86_64-apple-darwin.tar.gz"
    sha256 "9c3f631d1e2523c56d695006ddaf402a1eaf55838476ea75b21842ddaeea9043"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.35", shell_output("#{bin}/auv --version").strip
  end
end
