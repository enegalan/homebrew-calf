cask "calf" do
  version "1.0.2"
  sha256 "78893cf61a935a3c93f5e9b8c552ba99f558bfd14a05644f0d06a4cfe3bd50ef"

  url "https://github.com/enegalan/calf/releases/download/v#{version}/calf-#{version}.dmg"
  name "calf"
  desc "Lightweight, open-source alternative to Docker Desktop"
  homepage "https://github.com/enegalan/calf"

  app "calf.app"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/calf.app"],
                    sudo: false
    end
  end

  zap trash: [
    "~/.config/calf",
    "~/Library/Application Support/calf",
  ]
end
