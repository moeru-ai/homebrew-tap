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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.29/auv-aarch64-apple-darwin.tar.gz"
    sha256 "a0dac4df6c86de1c8e3d77bd189173db8f994991548308d74078aa9f3cbcda61"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.29/auv-x86_64-apple-darwin.tar.gz"
    sha256 "5851f8cc7d7a1ea995784002dce33c99126c08d4312a6ee53c82fb81b476f9ff"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.29", shell_output("#{bin}/auv --version").strip
  end
end
