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
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.34/auv-aarch64-apple-darwin.tar.gz"
    sha256 "7f2191596368701e833be0c6f926c3cb2ed7fae546e125c6148626a64d652131"
  elsif Hardware::CPU.intel?
    url "https://github.com/moeru-ai/auv/releases/download/v0.0.34/auv-x86_64-apple-darwin.tar.gz"
    sha256 "58637eb15188e4253885919172b5a934a6efdcaa6faa42add743d35acb801a87"
  end

  def install
    bin.install "auv"
  end

  test do
    assert_equal "auv 0.0.34", shell_output("#{bin}/auv --version").strip
  end
end
