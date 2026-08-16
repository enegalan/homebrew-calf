cask "calf" do
  version "1.0.14"
  sha256 "43d281f622c2f3002ffda95f8db1935d25cec3995de72e5e8e4c6028cf8d5b5b"

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
