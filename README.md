# polybar-mic-volume

Polybar module that displays the volume of a given input device using PulseAudio `pacmd` and controls it using `pactl`.

![Screenshot](/.github/screenshot.png?raw=true)

## Usage

To use this module, put the following module in your polybar config, substituting `MICROPHONE_NAME` with the name of the
device you want to display, and substituting `PATH_TO_SCRIPT` with the path to the `mic-volume.sh` script.

If you don't include `MICROPHONE_NAME` the default input device will be used
instead

```
[module/mic-volume]
type = custom/script
interval = 1
format = Mic: <label>
exec = bash PATH_TO_SCRIPT show-vol MICROPHONE_NAME

; Control actions (using pactl)
click-left = bash PATH_TO_SCRIPT mute-vol MICROPHONE_NAME
scroll-up = bash PATH_TO_SCRIPT inc-vol MICROPHONE_NAME
scroll-down = bash PATH_TO_SCRIPT dec-vol MICROPHONE_NAME
```

For example:

```
[module/mic-volume]
type = custom/script
interval = 1
format = Mic:<label>
exec = bash ~/.config/polybar/mic-volume/mic-volume.sh show-vol 'Meteor'

; Control actions (using pactl)
click-left = bash ~/.config/polybar/mic-volume/mic-volume.sh mute-vol 'Meteor'
scroll-up = bash ~/.config/polybar/mic-volume/mic-volume.sh inc-vol 'Meteor'
scroll-down = bash ~/.config/polybar/mic-volume/mic-volume.sh dec-vol 'Meteor'
```

**NB:**
Try to make `MICROPHONE_NAME` as unique as possible so that only one result will show up. If multiple results are
returned from the search then the first result will be displayed.
