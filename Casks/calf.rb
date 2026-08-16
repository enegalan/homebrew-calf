cask "calf" do
  version "1.0.19"
  sha256 "fb8fb899828cbe006ea6d6d2c9b466092c4d96fd72ed46b90cd6e45206baed84"

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
