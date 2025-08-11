### Kanata Config

- `config.kbd` is for macOS

#### Example LaunchDaemon


`com.furkan.kanata.plist`

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.furkan.kanata</string>

    <key>ProgramArguments</key>
    <array>
        <!-- <string>sudo</string> -->
        <string>launchctl</string>
        <string>asuser</string>
        <string>501</string> <!-- user UID can be retrived by `id -u $username` -->
        <string>/usr/local/bin/kanata</string> <!-- location of kanata binary-->
        <string>-c</string>
        <string>/Users/furkan/.config/kanata/config.kbd</string>
        <string>--debug</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>/tmp/kanata.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/kanata.err</string>
</dict>
</plist>
```

### LaunchDaemon commands

```bash
sudo launchctl load /Library/LaunchDaemons/com.furkan.kanata.plist
```


```bash
sudo launchctl start com.furkan.kanata
```
