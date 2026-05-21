toggle-karousel() {
    current=$(kreadconfig6 --file kwinrc --group Plugins --key karouselEnabled)
    if [[ "$current" == "true" ]]; then
        kwriteconfig6 --file kwinrc --group Plugins --key karouselEnabled false
        echo "Karousel disabled"
    else
        kwriteconfig6 --file kwinrc --group Plugins --key karouselEnabled true
        echo "Karousel enabled"
    fi
    qdbus6 org.kde.KWin /KWin reconfigure
}
