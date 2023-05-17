# polybar-mic-volume

> **Note**
> I don't use Linux anymore so I don't actively maintain this project, but feel
> free to make a PR for any fixes that are needed!

Polybar module that displays the volume of a given input device using PulseAudio
`pacmd` and controls it using `pactl`.

![Screenshot](/.github/screenshot.png?raw=true)

## Usage

To use this module, put the following module in your Polybar config,
substituting `MICROPHONE_NAME` with the name or index of the device you want to
display, and substituting `PATH_TO_SCRIPT` with the path to the `mic-volume.sh`
script.

If you don't include `MICROPHONE_NAME` the default input device will be used
instead.

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
exec = bash ~/.config/polybar/mic-volume/mic-volume.sh show-vol 'alsa_input.usb-Samson_Technologies_Samson_Meteor_Mic-00.analog-stereo'

; Control actions (using pactl)
; Example supplying the name of the source
click-left = bash ~/.config/polybar/mic-volume/mic-volume.sh mute-vol 'alsa_input.usb-Samson_Technologies_Samson_Meteor_Mic-00.analog-stereo'
; Example supplying the index of the source
scroll-up = bash ~/.config/polybar/mic-volume/mic-volume.sh inc-vol 2
; Example leaving the MICROPHONE_NAME blank and using the default source
scroll-down = bash ~/.config/polybar/mic-volume/mic-volume.sh dec-vol
```

> **Note**
> The name and index of the source can be found by running `pacmd list-sources`. Ignore
> the arrow brackets when using the name.
