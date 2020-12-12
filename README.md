# polybar-mic-volume

Polybar module that displays the volume of a given input device using PulseAudio `pacmd`.

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
format = Mic:<label>
exec = bash PATH_TO_SCRIPT MICROPHONE_NAME
```

For example:

```
[module/mic-volume]
type = custom/script
interval = 1
format = Mic:<label>
exec = bash ~/.config/polybar/mic-volume/mic-volume.sh 'Meteor'
```

**NB:**
Try to make `MICROPHONE_NAME` as unique as possible so that only one result will show up. If multiple results are
returned from the search then the first result will be displayed.
