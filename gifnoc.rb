# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Gifnoc < Formula
  desc "Gifnoc, the cloud friendly configuration and security manager"
  homepage "http://www.gifnoc.com"
  version "0.0.2"
  url "https://s3.amazonaws.com/downloads.cloud66.com/gifnoc/0.0.2/gifnoc_0.0.2.tar"
  sha256 "d377ebffdaafe9a4dccbb19163672882afbc088fdaad55b6a96afebff3739fbe"

  option "token=", "Your gifnoc's hosted name token (ie cloud66)"

  def default_agent_token
    "xxx"
  end

  def agent_token
    ARGV.value("token") || default_agent_token
  end

  plist_options :manual => "gifnoc start --runas proxy --upstream https://cloud66.gifnoc.com --port 9820 --binding 127.0.0.1 --ignore-cert-errors"

  def plist
    <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}/bin</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{HOMEBREW_PREFIX}/bin/gifnoc</string>
          <string>start</string>
          <string>--runas</string>
          <string>proxy</string>
          <string>--upstream</string>
          <string>https://#{agent_token}.gifnoc.com</string>
          <string>--port</string>
          <string>9820</string>
          <string>--binding</string>
          <string>127.0.0.1</string>
          <string>--ignore-cert-errors</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>#{HOMEBREW_PREFIX}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ProcessType</key>
        <string>Interactive</string>
        <key>ThrottleInterval</key>
        <integer>30</integer>
        <key>StandardOutPath</key>
        <string>#{var}/log/gifnoc.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/gifnoc.log</string>
      </dict>
      </plist>
    EOS
  end

  def install
    bin.install "gifnoc"
  end

  test do
    system "gifnoc help"
  end

end
