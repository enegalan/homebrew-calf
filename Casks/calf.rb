cask "calf" do
  version "0.9.17"
  sha256 "a2d3811807fe701357cc5adb166b4ec31652b266d5018757fc93fba3bee9e05e"

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
