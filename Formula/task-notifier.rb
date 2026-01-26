class TaskNotifier < Formula
  desc "Task completion email notification with OpenCode integration"
  homepage "https://github.com/FrankieeW/task-notifier"
  url "https://github.com/FrankieeW/task-notifier/archive/v1.0.4.tar.gz"
  sha256 "44530d2c91df18883fdd4d1404b5023a928831caceb58c738b14dc178947cf14"
  license "MIT"
  version "1.0.4"

  depends_on "python@3.11"

  option "without-opencode", "Install CLI tools only (skip OpenCode integration)"

  def install
    bin.install "bin/task-notify"
    bin.install "bin/notify-ai-task"

    unless build.without? "opencode"
      opencode_plugin_dir = "#{Dir.home}/.config/opencode/plugins"
      opencode_config_dir = "#{Dir.home}/.config/opencode"

      FileUtils.mkdir_p(opencode_plugin_dir)

      FileUtils.cp("opencode/task-notifier.ts", "#{opencode_plugin_dir}/task-notifier.ts")

      config_file = "#{opencode_config_dir}/task-notifier.jsonc"
      unless File.exist?(config_file)
        FileUtils.cp("opencode/task-notifier.default.jsonc", config_file)
        opoo "OpenCode config installed to #{config_file}"
      else
        opoo "OpenCode config already exists at #{config_file}, skipping"
      end
    end
  end

  def caveats
    s = <<~EOS
      Task Notifier has been installed!

      📝 Setup configuration:
        task-notify --setup

      ✅ Test installation:
        task-notify --test

      📚 Documentation:
        English: https://github.com/FrankieeW/task-notifier/blob/main/README.md
        中文: https://github.com/FrankieeW/task-notifier/blob/main/README_zh.md

    EOS

    if build.without? "opencode"
      s += "⚠️  OpenCode integration was skipped (--without-opencode)\n"
      s += "   To install OpenCode plugin manually:\n"
      s += "   curl -fsSL https://raw.githubusercontent.com/FrankieeW/task-notifier/main/scripts/install-opencode.sh | bash\n"
    else
      s += "✅ OpenCode plugin installed to ~/.config/opencode/\n"
      s += "   Restart OpenCode to load the plugin\n"
    end

    s
  end

  test do
    system "#{bin}/task-notify", "--help"
    assert_match "Task completion email notification", shell_output("#{bin}/task-notify --help")
    system "#{bin}/notify-ai-task", "--help"
  end
end
