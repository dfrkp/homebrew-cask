cask "futubull" do
  version "11.11.1618,202110281756"
  sha256 "6fe9fce68437220b0a4b7b84f763edbfbbe1f5d84b4e005a293dc0675c58672b"

  url "https://softwarefile.futunn.com/FTNNForMac_#{version.before_comma}_#{version.after_comma}_Website.dmg"
  name "Futubull"
  name "FutuNiuniu"
  desc "Trading application"
  homepage "https://www.futunn.com/"

  livecheck do
    url "https://www.futunn.com/download/history?client=11"
    strategy :page_match do |page|
      page.scan(%r{/FTNNForMac[._-]v?(\d+(?:\.\d+)+)[_-](\d+)[._-]Website\.dmg}i).map do |match|
        "#{match[0]},#{match[1]}"
      end
    end
  end

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "FutuNiuniu.app", target: "Futubull.app"
end
