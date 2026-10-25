class TempoTracker < Formula
  desc "Menu bar app that tracks your time per Jira ticket and sends it to Tempo"
  homepage "https://github.com/omniboost/tempo-tracker"
  url "https://github.com/omniboost/tempo-tracker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "49567fb08eecb1e42e61e12a19fb60de8cd7bfab9005349a4c10c09ae6cc9136"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos
  depends_on "python@3.13"

  def install
    python = formula_opt_bin("python@3.13")/"python3.13"
    # A virtualenv with the pinned dependencies from PyPI (prebuilt wheels, so PyObjC is not compiled here).
    system python, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-cache-dir", "--index-url", "https://pypi.org/simple",
           "-r", "requirements.txt"
    (libexec/Language::Python.site_packages(python)).install "tempo_tracker"
    (bin/"tempo-tracker").write <<~SH
      #!/bin/bash
      exec "#{opt_libexec}/bin/python" -m tempo_tracker "$@"
    SH
  end

  def caveats
    <<~EOS
      Start Tempo Tracker now and every time you log in:
        brew services start tempo-tracker

      On first start it asks for your Jira site, email and API tokens.

      Installed it before with install.sh? Stop that copy first, or two will run
      (your tokens and tracked time stay):
        launchctl bootout gui/$(id -u)/io.omniboost.tempo-tracker
        rm ~/Library/LaunchAgents/io.omniboost.tempo-tracker.plist
    EOS
  end

  service do
    run opt_bin/"tempo-tracker"
    keep_alive successful_exit: false
    process_type :interactive
    log_path var/"log/tempo-tracker.log"
    error_log_path var/"log/tempo-tracker.log"
  end

  test do
    system libexec/"bin/python", "-c", "import tempo_tracker.app, tempo_tracker.config"
  end
end
