cask "calf" do
  version "1.0.1"
  sha256 "9e73c6186cfefcf8c3a85edce604885e39c074eee7985936e63bdb1c0e63662c"

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
