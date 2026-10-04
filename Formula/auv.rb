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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.27/auv-aarch64-apple-darwin.tar.gz"
    sha256 "451d19a6466ae9d4edbeb47bb920d04ee55e97c0c75d74961747464f600fbe41"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.27/auv-x86_64-apple-darwin.tar.gz"
    sha256 "ee2e928e4ea98dfec9c58ae694ddf7f2926bd541ebfffb1a0456c6cec3f5abac"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.27", shell_output("#{bin}/auv --version").strip
  end
end
